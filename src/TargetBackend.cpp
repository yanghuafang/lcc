#include "TargetBackend.hpp"

#include <optional>
#include <stdexcept>

#include <llvm/CodeGen/MachineModuleInfo.h>
#include <llvm/CodeGen/Passes.h>
#include <llvm/CodeGen/TargetPassConfig.h>
#include <llvm/IR/LegacyPassManager.h>
#include <llvm/IR/Module.h>
#include <llvm/MC/TargetRegistry.h>
#include <llvm/Support/CodeGen.h>
#include <llvm/Support/FileSystem.h>
#include <llvm/Support/TargetSelect.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Target/TargetMachine.h>
#include <llvm/Target/TargetOptions.h>
#include <llvm/TargetParser/Host.h>

#include "passes/MachineInstrStatsPass.hpp"

namespace {

void initializeAllTargets() {
  llvm::InitializeAllTargetInfos();
  llvm::InitializeAllTargets();
  llvm::InitializeAllTargetMCs();
  llvm::InitializeAllAsmParsers();
  llvm::InitializeAllAsmPrinters();
}

// Map CLI -O to TargetMachine codegen opt (legacy PM). Separate from
// IrOptimizer IR passes. empty/O0 must be None — createTargetMachine
// otherwise defaults to Default (~O2 machine opts). See LlvmTools.md (M12).
llvm::CodeGenOptLevel resolveCodeGenOptLevel(
    const std::string& optimizationLevel) {
  if (optimizationLevel.empty() || optimizationLevel == "O0") {
    return llvm::CodeGenOptLevel::None;
  }
  if (optimizationLevel == "O1") {
    return llvm::CodeGenOptLevel::Less;
  }
  if (optimizationLevel == "O2" || optimizationLevel == "Os" ||
      optimizationLevel == "Oz") {
    return llvm::CodeGenOptLevel::Default;
  }
  if (optimizationLevel == "O3") {
    return llvm::CodeGenOptLevel::Aggressive;
  }
  return llvm::CodeGenOptLevel::None;
}

// Manually drive the legacy codegen pipeline so a custom MachineFunctionPass can
// be spliced in just before the AsmPrinter (M17). This mirrors
// CodeGenTargetMachineImpl::addPassesToEmitFile but adds one machine pass on the
// fully lowered MIR. Only used when -machine-stats is set; the default emission
// path stays on the stock addPassesToEmitFile so committed goldens are untouched.
// Returns true on failure, matching addPassesToEmitFile's convention.
bool addEmitPassesWithMachineStats(llvm::TargetMachine& targetMachine,
                                   llvm::legacy::PassManager& pm,
                                   llvm::raw_pwrite_stream& out,
                                   llvm::CodeGenFileType fileType,
                                   const std::string& statsPath) {
  llvm::TargetPassConfig* passConfig = targetMachine.createPassConfig(pm);
  if (passConfig == nullptr) {
    return true;
  }
  passConfig->setDisableVerify(true);
  pm.add(passConfig);  // PassManager takes ownership.

  auto* mmiwp = new llvm::MachineModuleInfoWrapperPass(&targetMachine);
  pm.add(mmiwp);

  if (passConfig->addISelPasses()) {
    return true;
  }
  passConfig->addMachinePasses();
  passConfig->setInitialized();

  // Runs on fully lowered MIR (post-regalloc), immediately before asm printing.
  pm.add(new MachineInstrStatsPass(statsPath));

  if (targetMachine.addAsmPrinter(pm, out, nullptr, fileType,
                                  mmiwp->getMMI().getContext())) {
    return true;
  }
  pm.add(llvm::createFreeMachineFunctionPass());
  return false;
}

}  // namespace

void emit(llvm::Module& module, const std::string& path,
          llvm::CodeGenFileType fileType,
          const TargetBackendOptions& options) {
  initializeAllTargets();

  std::string error;
  const std::string targetTriple = options.triple.empty()
                                       ? llvm::sys::getDefaultTargetTriple()
                                       : options.triple;
  const llvm::Target* target =
      llvm::TargetRegistry::lookupTarget(targetTriple, error);
  if (target == nullptr) {
    throw std::runtime_error(error);
  }

  llvm::TargetOptions targetOptions;
  // Emit position-independent code. A null model lets the target pick its
  // default, which is Static (absolute relocations) on ELF; modern Linux links
  // executables as PIE by default and rejects those, which is why lcc objects
  // previously needed -no-pie. Reloc::PIC_ makes the objects link cleanly into
  // a PIE without extra flags and matches Darwin's existing default.
  const std::optional<llvm::Reloc::Model> optionalModel = llvm::Reloc::PIC_;
  const llvm::CodeGenOptLevel codegenLevel =
      resolveCodeGenOptLevel(options.optimizationLevel);
  std::unique_ptr<llvm::TargetMachine> targetMachine(target->createTargetMachine(
      targetTriple, options.cpu, options.features, targetOptions, optionalModel,
      std::nullopt, codegenLevel));

  module.setDataLayout(targetMachine->createDataLayout());
  module.setTargetTriple(targetTriple);
  // Record PIC/PIE level 2 (matching clang -fPIE) so the emitted IR documents
  // the PIC model chosen above. Defined symbols still reach through the GOT/PLT
  // on ELF because lcc does not mark globals dso_local; that affects only
  // codegen quality, not PIE linkability.
  module.setPICLevel(llvm::PICLevel::BigPIC);
  module.setPIELevel(llvm::PIELevel::Large);

  std::error_code errCode;
  llvm::raw_fd_ostream outStream(path, errCode, llvm::sys::fs::OF_None);
  if (errCode.value() != 0) {
    throw std::runtime_error("Failed to open file " + path + " errCode " +
                             errCode.message());
  }

  llvm::legacy::PassManager pm;
  const bool failed =
      options.machineStatsPath.empty()
          ? targetMachine->addPassesToEmitFile(pm, outStream, nullptr, fileType)
          : addEmitPassesWithMachineStats(*targetMachine, pm, outStream,
                                          fileType, options.machineStatsPath);
  if (failed) {
    const char* kind =
        fileType == llvm::CodeGenFileType::AssemblyFile ? "assembly" : "object";
    throw std::runtime_error(std::string("Failed to emit ") + kind + " file!");
  }

  pm.run(module);
  outStream.flush();
}

void TargetBackend::emitObject(llvm::Module& module, const std::string& path,
                               const TargetBackendOptions& options) {
  emit(module, path, llvm::CodeGenFileType::ObjectFile, options);
}

void TargetBackend::emitAssembly(llvm::Module& module, const std::string& path,
                                 const TargetBackendOptions& options) {
  emit(module, path, llvm::CodeGenFileType::AssemblyFile, options);
}
