#include "TargetBackend.hpp"

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

#include <optional>
#include <stdexcept>

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
// otherwise defaults to Default (~O2 machine opts). See LlvmTools.md.
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

}  // namespace

void emit(llvm::Module& module, const std::string& path,
          llvm::CodeGenFileType fileType, const TargetBackendOptions& options) {
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
  std::optional<llvm::Reloc::Model> optionalModel;
  const llvm::CodeGenOptLevel codegenLevel =
      resolveCodeGenOptLevel(options.optimizationLevel);
  std::unique_ptr<llvm::TargetMachine> targetMachine(
      target->createTargetMachine(targetTriple, options.cpu, options.features,
                                  targetOptions, optionalModel, std::nullopt,
                                  codegenLevel));

  module.setDataLayout(targetMachine->createDataLayout());
  module.setTargetTriple(targetTriple);

  std::error_code errCode;
  llvm::raw_fd_ostream outStream(path, errCode, llvm::sys::fs::OF_None);
  if (errCode.value() != 0) {
    throw std::runtime_error("Failed to open file " + path + " errCode " +
                             errCode.message());
  }

  llvm::legacy::PassManager pm;
  if (targetMachine->addPassesToEmitFile(pm, outStream, nullptr, fileType)) {
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
