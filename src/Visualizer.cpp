#include <stdio.h>

#include <string>
#include <utility>

#include "AbstractSyntaxTree.hpp"

namespace AST {

std::pair<std::string, std::string> Program::genGraph() {
  std::string root = "Program";
  std::string tree = "Program [label = Program]\n";
  for (Decl* decl : *decls_) {
    if (decl != nullptr) {
      std::pair<std::string, std::string> graph = decl->genGraph();
      tree += root + " -> " + graph.first + "\n";
      tree += graph.second;
    }
  }
  return std::make_pair(root, tree);
}

// Declarations

std::pair<std::string, std::string> FuncDecl::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "FuncDecl_" + id;
  std::string tree = root + " [label = FuncDecl]\n";

  // retType_
  if (retType_ != nullptr) {
    std::pair<std::string, std::string> retTypeGraph = retType_->genGraph();
    tree += root + " -> " + retTypeGraph.first + "\n";
    tree += retTypeGraph.second;
  }

  // funcName_
  std::string funcNameNode = funcName_ + "_" + id;
  tree += funcNameNode + "[ label = " + funcName_ + "]\n";
  tree += root + " -> " + funcNameNode + "\n";

  // paramList_
  if (paramList_ != nullptr) {
    std::pair<std::string, std::string> paramListGraph = paramList_->genGraph();
    tree += root + " -> " + paramListGraph.first + "\n";
    tree += paramListGraph.second;
  }

  // funcBody_
  if (funcBody_ != nullptr) {
    std::pair<std::string, std::string> funcBodyGraph = funcBody_->genGraph();
    tree += root + " -> " + funcBodyGraph.first + "\n";
    tree += funcBodyGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> Param::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "Param_" + id;
  std::string tree = root + " [label = Param]\n";

  // varType_
  if (varType_ != nullptr) {
    std::pair<std::string, std::string> varTypeGraph = varType_->genGraph();
    tree += root + " -> " + varTypeGraph.first + "\n";
    tree += varTypeGraph.second;
  }

  // varName_
  std::string varName = varName_.empty() ? "anonymous" : varName_;
  std::string varNameNode = varName + "_" + id;
  tree += varNameNode + " [label = " + varName + "]\n";
  tree += root + " -> " + varNameNode + "\n";

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> ParamList::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "ParamList_" + id;
  std::string tree = root + " [label = ParamList]\n";

  for (Param* param : *this) {
    if (param != nullptr) {
      std::pair<std::string, std::string> graph = param->genGraph();
      tree += root + " -> " + graph.first + "\n";
      tree += graph.second;
    }
  }

  // isVariant_
  if (isVariant_) {
    std::string variant = "\"...\"";
    std::string variantNode = "\"..._" + id + "\"";
    tree += variantNode + " [label = " + variant + "]\n";
    tree += root + " -> " + variantNode + "\n";
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> FuncBody::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "FuncBody_" + id;
  std::string tree = root + " [label = FuncBody]\n";

  // content_
  for (Stmt* stmt : *content_) {
    if (stmt != nullptr) {
      std::pair<std::string, std::string> graph = stmt->genGraph();
      tree += root + " -> " + graph.first + "\n";
      tree += graph.second;
    }
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> VarDecl::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "VarDecl_" + id;
  std::string tree = root + " [label = VarDecl]\n";

  // varType_
  if (varType_ != nullptr) {
    std::pair<std::string, std::string> varTypeGraph = varType_->genGraph();
    tree += root + " -> " + varTypeGraph.first + "\n";
    tree += varTypeGraph.second;
  }

  // varList_
  for (VarInit* var : *varList_) {
    if (var != nullptr) {
      std::pair<std::string, std::string> graph = var->genGraph();
      tree += root + " -> " + graph.first + "\n";
      tree += graph.second;
    }
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> VarInit::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "VarInit_" + id;
  std::string tree = root + " [label = VarInit]\n";

  // varName_
  std::string varNameNode = varName_ + "_" + id;
  tree += varNameNode + " [label = " + varName_ + "]\n";
  tree += root + " -> " + varNameNode + "\n";

  // initialExpr_
  if (initialExpr_ != nullptr) {
    std::pair<std::string, std::string> initialExprGraph =
        initialExpr_->genGraph();
    tree += root + " -> " + initialExprGraph.first + "\n";
    tree += initialExprGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> TypeDecl::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "TypeDecl_" + id;
  std::string tree = root + " [label = TypeDecl]\n";

  // varType_
  if (varType_ != nullptr) {
    std::pair<std::string, std::string> varTypeGraph = varType_->genGraph();
    tree += root + " -> " + varTypeGraph.first + "\n";
    tree += varTypeGraph.second;
  }

  return std::make_pair(root, tree);
}

// Variable Types

std::pair<std::string, std::string> BuiltinType::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "BuiltinType_" + id;
  std::string tree = root + " [label = BuiltinType]\n";

  // isConst_
  if (isConst_) {
    std::string isConst = "const";
    std::string isConstNode = isConst + "_" + id;
    tree += isConstNode + " [label = " + isConst + "]\n";
    tree += root + " -> " + isConstNode + "\n";
  }

  // typeName_
  std::string typeNameNode = "\"" + typeName_ + "_" + id + "\"";
  tree += typeNameNode + " [label = \"" + typeName_ + "\"]\n";
  tree += root + " -> " + typeNameNode + "\n";

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> PointerType::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "PointerType_" + id;
  std::string tree = root + " [label = PointerType]\n";

  // isConst_
  if (isConst_) {
    std::string isConst = "const";
    std::string isConstNode = isConst + "_" + id;
    tree += isConstNode + " [label = " + isConst + "]\n";
    tree += root + " -> " + isConstNode + "\n";
  }

  // typeName_
  std::string typeNameNode = "\"" + typeName_ + "_" + id + "\"";
  tree += typeNameNode + " [label = \"" + typeName_ + "\"]\n";
  tree += root + " -> " + typeNameNode + "\n";

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> ArrayType::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "ArrayType_" + id;
  std::string tree = root + " [label = ArrayType]\n";

  // isConst_
  if (isConst_) {
    std::string isConst = "const";
    std::string isConstNode = isConst + "_" + id;
    tree += isConstNode + " [label = " + isConst + "]\n";
    tree += root + " -> " + isConstNode + "\n";
  }

  // typeName_
  std::string typeNameNode = "\"" + typeName_ + "_" + id + "\"";
  tree += typeNameNode + " [label = \"" + typeName_ + "\"]\n";
  tree += root + " -> " + typeNameNode + "\n";

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> DefinedType::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "DefinedType_" + id;
  std::string tree = root + " [label = DefinedType]\n";

  // isConst_
  if (isConst_) {
    std::string isConst = "const";
    std::string isConstNode = isConst + "_" + id;
    tree += isConstNode + " [label = " + isConst + "]\n";
    tree += root + " -> " + isConstNode + "\n";
  }

  // typeName_
  std::string typeNameNode = "\"" + typeName_ + "_" + id + "\"";
  tree += typeNameNode + " [label = \"" + typeName_ + "\"]\n";
  tree += root + " -> " + typeNameNode + "\n";

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> StructType::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "StructType_" + id;
  std::string tree = root + " [label = StructType]\n";

  // isConst_
  if (isConst_) {
    std::string isConst = "const";
    std::string isConstNode = isConst + "_" + id;
    tree += isConstNode + " [label = " + isConst + "]\n";
    tree += root + " -> " + isConstNode + "\n";
  }

  // typeName_
  std::string typeNameNode = "\"" + typeName_ + "_" + id + "\"";
  tree += typeNameNode + " [label = \"" + typeName_ + "\"]\n";
  tree += root + " -> " + typeNameNode + "\n";

  for (FieldDecl* fieldDecl : *structBody_) {
    if (fieldDecl != nullptr) {
      std::pair<std::string, std::string> graph = fieldDecl->genGraph();
      tree += root + " -> " + graph.first + "\n";
      tree += graph.second;
    }
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> UnionType::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "UnionType_" + id;
  std::string tree = root + " [label = UnionType]\n";

  // isConst_
  if (isConst_) {
    std::string isConst = "const";
    std::string isConstNode = isConst + "_" + id;
    tree += isConstNode + " [label = " + isConst + "]\n";
    tree += root + " -> " + isConstNode + "\n";
  }

  // typeName_
  std::string typeNameNode = "\"" + typeName_ + "_" + id + "\"";
  tree += typeNameNode + " [label = \"" + typeName_ + "\"]\n";
  tree += root + " -> " + typeNameNode + "\n";

  for (FieldDecl* fieldDecl : *unionBody_) {
    if (fieldDecl != nullptr) {
      std::pair<std::string, std::string> graph = fieldDecl->genGraph();
      tree += root + " -> " + graph.first + "\n";
      tree += graph.second;
    }
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> FieldDecl::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "FieldDecl_" + id;
  std::string tree = root + " [label = FieldDecl]\n";

  // varType_
  if (varType_ != nullptr) {
    std::pair<std::string, std::string> varTypeGraph = varType_->genGraph();
    tree += root + " -> " + varTypeGraph.first + "\n";
    tree += varTypeGraph.second;
  }

  // memberList_
  for (const std::string& member : *memberList_) {
    std::string memberNode = member + "_" + id;
    tree += memberNode + " [label = " + member + "]\n";
    tree += root + " -> " + memberNode + "\n";
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> EnumType::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "EnumType_" + id;
  std::string tree = root + " [label = EnumType]\n";

  // isConst_
  if (isConst_) {
    std::string isConst = "const";
    std::string isConstNode = isConst + "_" + id;
    tree += isConstNode + " [label = " + isConst + "]\n";
    tree += root + " -> " + isConstNode + "\n";
  }

  // typeName_
  std::string typeNameNode = "\"" + typeName_ + "_" + id + "\"";
  tree += typeNameNode + " [label = \"" + typeName_ + "\"]\n";
  tree += root + " -> " + typeNameNode + "\n";

  for (Enum* enumEntity : *enumList_) {
    if (enumEntity != nullptr) {
      std::pair<std::string, std::string> graph = enumEntity->genGraph();
      tree += root + " -> " + graph.first + "\n";
      tree += graph.second;
    }
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> Enum::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "Enum_" + id;
  std::string tree = root + " [label = Enum]\n";

  // name_
  std::string nameNode = name_ + "_" + id;
  tree += nameNode + " [label = " + name_ + "]\n";
  tree += root + " -> " + nameNode + "\n";

  // hasValue_, value_
  if (hasValue_) {
    std::string valueNode = "\"" + std::to_string(value_) + "_" + id + "\"";
    tree += valueNode + " [label = \"" + std::to_string(value_) + "\"]\n";
    tree += root + " -> " + valueNode + "\n";
  }
  return std::make_pair(root, tree);
}

// Statements

std::pair<std::string, std::string> IfStmt::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "IfStmt_" + id;
  std::string tree = root + " [label = IfStmt]\n";

  // condition_
  if (condition_ != nullptr) {
    std::pair<std::string, std::string> conditionGraph = condition_->genGraph();
    tree += root + " -> " + conditionGraph.first + "\n";
    tree += conditionGraph.second;
  }

  // thenStmt_
  if (thenStmt_ != nullptr) {
    std::pair<std::string, std::string> thenStmtGraph = thenStmt_->genGraph();
    tree += root + " -> " + thenStmtGraph.first + "\n";
    tree += thenStmtGraph.second;
  }

  // elseStmt_
  if (elseStmt_ != nullptr) {
    std::pair<std::string, std::string> elseStmtGraph = elseStmt_->genGraph();
    tree += root + " -> " + elseStmtGraph.first + "\n";
    tree += elseStmtGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> SwitchStmt::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "SwitchStmt_" + id;
  std::string tree = root + " [label = SwitchStmt]\n";

  // matcher_
  if (matcher_ != nullptr) {
    std::pair<std::string, std::string> matcherGraph = matcher_->genGraph();
    tree += root + " -> " + matcherGraph.first + "\n";
    tree += matcherGraph.second;
  }

  // caseStmtList_
  for (CaseStmt* caseStmt : *caseStmtList_) {
    if (caseStmt != nullptr) {
      std::pair<std::string, std::string> caseStmtGraph = caseStmt->genGraph();
      tree += root + " -> " + caseStmtGraph.first + "\n";
      tree += caseStmtGraph.second;
    }
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> CaseStmt::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "CaseStmt_" + id;
  std::string tree = root + " [label = CaseStmt]\n";

  // condition_
  if (condition_ != nullptr) {
    std::pair<std::string, std::string> conditionGraph = condition_->genGraph();
    tree += root + " -> " + conditionGraph.first + "\n";
    tree += conditionGraph.second;
  }

  // content_
  for (Stmt* stmt : *content_) {
    if (stmt != nullptr) {
      std::pair<std::string, std::string> graph = stmt->genGraph();
      tree += root + " -> " + graph.first + "\n";
      tree += graph.second;
    }
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> ForStmt::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "ForStmt_" + id;
  std::string tree = root + " [label = ForStmt]\n";

  // initial_
  if (initial_ != nullptr) {
    std::pair<std::string, std::string> initialGraph = initial_->genGraph();
    tree += root + " -> " + initialGraph.first + "\n";
    tree += initialGraph.second;
  }

  // condition_
  if (condition_ != nullptr) {
    std::pair<std::string, std::string> conditionGraph = condition_->genGraph();
    tree += root + " -> " + conditionGraph.first + "\n";
    tree += conditionGraph.second;
  }

  // update_
  if (update_ != nullptr) {
    std::pair<std::string, std::string> updateGraph = update_->genGraph();
    tree += root + " -> " + updateGraph.first + "\n";
    tree += updateGraph.second;
  }

  // loopBody_
  if (loopBody_ != nullptr) {
    std::pair<std::string, std::string> loopBodyGraph = loopBody_->genGraph();
    tree += root + " -> " + loopBodyGraph.first + "\n";
    tree += loopBodyGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> DoStmt::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "DoStmt_" + id;
  std::string tree = root + " [label = DoStmt]\n";

  // loopBody_
  if (loopBody_ != nullptr) {
    std::pair<std::string, std::string> loopBodyGraph = loopBody_->genGraph();
    tree += root + " -> " + loopBodyGraph.first + "\n";
    tree += loopBodyGraph.second;
  }

  // condition_
  if (condition_ != nullptr) {
    std::pair<std::string, std::string> conditionGraph = condition_->genGraph();
    tree += root + " -> " + conditionGraph.first + "\n";
    tree += conditionGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> WhileStmt::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "WhileStmt_" + id;
  std::string tree = root + " [label = WhileStmt]\n";

  // condition_
  if (condition_ != nullptr) {
    std::pair<std::string, std::string> conditionGraph = condition_->genGraph();
    tree += root + " -> " + conditionGraph.first + "\n";
    tree += conditionGraph.second;
  }

  // loopBody_
  if (loopBody_ != nullptr) {
    std::pair<std::string, std::string> loopBodyGraph = loopBody_->genGraph();
    tree += root + " -> " + loopBodyGraph.first + "\n";
    tree += loopBodyGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> ContinueStmt::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "ContinueStmt_" + id;
  std::string tree = root + " [label = ContinueStmt]\n";
  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> BreakStmt::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "BreakStmt_" + id;
  std::string tree = root + " [label = BreakStmt]\n";
  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> ReturnStmt::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "ReturnStmt_" + id;
  std::string tree = root + " [label = ReturnStmt]\n";

  // retVal_
  if (retVal_ != nullptr) {
    std::pair<std::string, std::string> retValGraph = retVal_->genGraph();
    tree += root + " -> " + retValGraph.first + "\n";
    tree += retValGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> Block::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "Block_" + id;
  std::string tree = root + " [label = Block]\n";

  // content_
  for (Stmt* stmt : *content_) {
    if (stmt != nullptr) {
      std::pair<std::string, std::string> graph = stmt->genGraph();
      tree += root + " -> " + graph.first + "\n";
      tree += graph.second;
    }
  }

  return std::make_pair(root, tree);
}

// Expressions

std::pair<std::string, std::string> Variable::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "Variable_" + id;
  std::string tree = root + " [label = Variable]\n";

  // varName_
  std::string varNameNode = varName_ + "_" + id;
  tree += varNameNode + " [label = " + varName_ + "]\n";
  tree += root + " -> " + varNameNode + "\n";

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> Constant::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "Constant_" + id;
  std::string tree = root + " [label = Constant]\n";

  std::string node;
  std::string boolValue;

  switch (typeId_) {
    case BuiltinType::TypeId::CHAR:
      node = "char_" + id;
      tree += node + " [label = \"" + std::to_string(charValue_) + "\"]\n";
      break;
    case BuiltinType::TypeId::INT:
      node = "int_" + id;
      tree += node + " [label = \"" + std::to_string(intValue_) + "\"]\n";
      break;
    case BuiltinType::TypeId::UINT:
      node = "uint_" + id;
      tree += node + " [label = \"" + std::to_string(uintValue_) + "\"]\n";
      break;
    case BuiltinType::TypeId::LONG:
      node = "long_" + id;
      tree += node + " [label = \"" + std::to_string(longValue_) + "\"]\n";
      break;
    case BuiltinType::TypeId::ULONG:
      node = "ulong_" + id;
      tree += node + " [label = \"" + std::to_string(ulongValue_) + "\"]\n";
      break;
    case BuiltinType::TypeId::FLOAT:
      node = "float_" + id;
      tree += node + " [label = \"" + std::to_string(floatValue_) + "\"]\n";
      break;
    case BuiltinType::TypeId::DOUBLE:
      node = "double_" + id;
      tree += node + " [label = \"" + std::to_string(doubleValue_) + "\"]\n";
      break;
    case BuiltinType::TypeId::BOOL:
      node = "bool_" + id;
      boolValue = boolValue_ ? "true" : "false";
      tree += node + " [label = \"" + boolValue + "\"]\n";
      break;
    default:
      node = "unsupported_" + id;
      tree += node + " [label = unsupported ]\n";
      break;
  }

  tree += root + " -> " + node + "\n";

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> ConstStr::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "ConstStr_" + id;
  std::string tree = root + " [label = ConstStr]\n";

  std::string str = str_;
  str.erase(std::remove(str.begin(), str.end(), '\n'), str.end());
  std::string node = "str_" + id;
  tree += node + " [label = \"" + str + "\"]\n";
  tree += root + " -> " + node + "\n";

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> CommaExpr::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "CommaExpr_" + id;
  std::string tree = root + " [label = CommaExpr]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> FuncCall::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "FuncCall_" + id;
  std::string tree = root + " [label = FuncCall]\n";

  // funcName_
  std::string funcNameNode = funcName_ + "_" + id;
  tree += funcNameNode + "[ label = " + funcName_ + "]\n";
  tree += root + " -> " + funcNameNode + "\n";

  // argList_
  for (Expr* arg : *argList_) {
    if (arg != nullptr) {
      std::pair<std::string, std::string> graph = arg->genGraph();
      tree += root + " -> " + graph.first + "\n";
      tree += graph.second;
    }
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> StructRef::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "StructRef_" + id;
  std::string tree = root + " [label = StructRef]\n";

  // struct_
  if (struct_ != nullptr) {
    std::pair<std::string, std::string> graph = struct_->genGraph();
    tree += root + " -> " + graph.first + "\n";
    tree += graph.second;
  }

  // memberName_
  std::string memberNameNode = memberName_ + "_" + id;
  tree += memberNameNode + "[ label = " + memberName_ + "]\n";
  tree += root + " -> " + memberNameNode + "\n";

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> StructDeref::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "StructDeref_" + id;
  std::string tree = root + " [label = StructDeref]\n";

  // structPtr_
  if (structPtr_ != nullptr) {
    std::pair<std::string, std::string> graph = structPtr_->genGraph();
    tree += root + " -> " + graph.first + "\n";
    tree += graph.second;
  }

  // memberName_
  std::string memberNameNode = memberName_ + "_" + id;
  tree += memberNameNode + "[ label = " + memberName_ + "]\n";
  tree += root + " -> " + memberNameNode + "\n";

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> Subscript::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "Subscript_" + id;
  std::string tree = root + " [label = Subscript]\n";

  // array_
  if (array_ != nullptr) {
    std::pair<std::string, std::string> arrayGraph = array_->genGraph();
    tree += root + " -> " + arrayGraph.first + "\n";
    tree += arrayGraph.second;
  }

  // index_
  if (index_ != nullptr) {
    std::pair<std::string, std::string> indexGraph = index_->genGraph();
    tree += root + " -> " + indexGraph.first + "\n";
    tree += indexGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> TypeCast::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "TypeCast_" + id;
  std::string tree = root + " [label = TypeCast]\n";

  // varType_
  if (varType_ != nullptr) {
    std::pair<std::string, std::string> varTypeGraph = varType_->genGraph();
    tree += root + " -> " + varTypeGraph.first + "\n";
    tree += varTypeGraph.second;
  }

  // operand_
  if (operand_ != nullptr) {
    std::pair<std::string, std::string> operandGraph = operand_->genGraph();
    tree += root + " -> " + operandGraph.first + "\n";
    tree += operandGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> SizeOf::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "SizeOf_" + id;
  std::string tree = root + " [label = SizeOf]\n";

  // varType_
  if (varType_ != nullptr) {
    std::pair<std::string, std::string> varTypeGraph = varType_->genGraph();
    tree += root + " -> " + varTypeGraph.first + "\n";
    tree += varTypeGraph.second;
  }

  // expr_
  if (expr_ != nullptr) {
    std::pair<std::string, std::string> exprGraph = expr_->genGraph();
    tree += root + " -> " + exprGraph.first + "\n";
    tree += exprGraph.second;
  }

  // identifier_
  if (!identifier_.empty()) {
    std::string identifierNode = identifier_ + "_" + id;
    tree += identifierNode + " [label = " + identifier_ + "]\n";
    tree += root + " -> " + identifierNode + "\n";
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> UnaryPlus::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "UnaryPlus_" + id;
  std::string tree = root + " [label = UnaryPlus]\n";

  // operand_
  if (operand_ != nullptr) {
    std::pair<std::string, std::string> operandGraph = operand_->genGraph();
    tree += root + " -> " + operandGraph.first + "\n";
    tree += operandGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> UnaryMinus::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "UnaryMinus_" + id;
  std::string tree = root + " [label = UnaryMinus]\n";

  // operand_
  if (operand_ != nullptr) {
    std::pair<std::string, std::string> operandGraph = operand_->genGraph();
    tree += root + " -> " + operandGraph.first + "\n";
    tree += operandGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> PointerDeref::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "PointerDeref_" + id;
  std::string tree = root + " [label = PointerDeref]\n";

  // operand_
  if (operand_ != nullptr) {
    std::pair<std::string, std::string> operandGraph = operand_->genGraph();
    tree += root + " -> " + operandGraph.first + "\n";
    tree += operandGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> AddressOf::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "AddressOf_" + id;
  std::string tree = root + " [label = AddressOf]\n";

  // operand_
  if (operand_ != nullptr) {
    std::pair<std::string, std::string> operandGraph = operand_->genGraph();
    tree += root + " -> " + operandGraph.first + "\n";
    tree += operandGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> Assign::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "Assign_" + id;
  std::string tree = root + " [label = Assign]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> Add::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "Add_" + id;
  std::string tree = root + " [label = Add]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> Sub::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "Sub_" + id;
  std::string tree = root + " [label = Sub]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> Mul::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "Mul_" + id;
  std::string tree = root + " [label = Mul]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> Div::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "Div_" + id;
  std::string tree = root + " [label = Div]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> Mod::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "Mod_" + id;
  std::string tree = root + " [label = Mod]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> PostfixInc::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "PostfixInc_" + id;
  std::string tree = root + " [label = PostfixInc]\n";

  // operand_
  if (operand_ != nullptr) {
    std::pair<std::string, std::string> operandGraph = operand_->genGraph();
    tree += root + " -> " + operandGraph.first + "\n";
    tree += operandGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> PostfixDec::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "PostfixDec_" + id;
  std::string tree = root + " [label = PostfixDec]\n";

  // operand_
  if (operand_ != nullptr) {
    std::pair<std::string, std::string> operandGraph = operand_->genGraph();
    tree += root + " -> " + operandGraph.first + "\n";
    tree += operandGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> PrefixInc::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "PrefixInc_" + id;
  std::string tree = root + " [label = PrefixInc]\n";

  // operand_
  if (operand_ != nullptr) {
    std::pair<std::string, std::string> operandGraph = operand_->genGraph();
    tree += root + " -> " + operandGraph.first + "\n";
    tree += operandGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> PrefixDec::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "PrefixDec_" + id;
  std::string tree = root + " [label = PrefixDec]\n";

  // operand_
  if (operand_ != nullptr) {
    std::pair<std::string, std::string> operandGraph = operand_->genGraph();
    tree += root + " -> " + operandGraph.first + "\n";
    tree += operandGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> AddAssign::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "AddAssign_" + id;
  std::string tree = root + " [label = AddAssign]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> SubAssign::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "SubAssign_" + id;
  std::string tree = root + " [label = SubAssign]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> MulAssign::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "MulAssign_" + id;
  std::string tree = root + " [label = MulAssign]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> DivAssign::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "DivAssign_" + id;
  std::string tree = root + " [label = DivAssign]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> ModAssign::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "ModAssign_" + id;
  std::string tree = root + " [label = ModAssign]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> BitwiseAnd::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "BitwiseAnd_" + id;
  std::string tree = root + " [label = BitwiseAnd]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> BitwiseOr::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "BitwiseOr_" + id;
  std::string tree = root + " [label = BitwiseOr]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> BitwiseXor::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "BitwiseXor_" + id;
  std::string tree = root + " [label = BitwiseXor]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> BitwiseNot::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "BitwiseNot_" + id;
  std::string tree = root + " [label = BitwiseNot]\n";

  // operand_
  if (operand_ != nullptr) {
    std::pair<std::string, std::string> operandGraph = operand_->genGraph();
    tree += root + " -> " + operandGraph.first + "\n";
    tree += operandGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> BitwiseAndAssign::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "BitwiseAndAssign_" + id;
  std::string tree = root + " [label = BitwiseAndAssign]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> BitwiseOrAssign::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "BitwiseOrAssign_" + id;
  std::string tree = root + " [label = BitwiseOrAssign]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> BitwiseXorAssign::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "BitwiseXorAssign_" + id;
  std::string tree = root + " [label = BitwiseXorAssign]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> LeftShift::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "LeftShift_" + id;
  std::string tree = root + " [label = LeftShift]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> RightShift::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "RightShift_" + id;
  std::string tree = root + " [label = RightShift]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> LeftShiftAssign::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "LeftShiftAssign_" + id;
  std::string tree = root + " [label = LeftShiftAssign]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> RightShiftAssign::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "RightShiftAssign_" + id;
  std::string tree = root + " [label = RightShiftAssign]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> LogicAnd::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "LogicAnd_" + id;
  std::string tree = root + " [label = LogicAnd]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> LogicOr::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "LogicOr_" + id;
  std::string tree = root + " [label = LogicOr]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> LogicNot::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "LogicNot_" + id;
  std::string tree = root + " [label = LogicNot]\n";

  // operand_
  if (operand_ != nullptr) {
    std::pair<std::string, std::string> operandGraph = operand_->genGraph();
    tree += root + " -> " + operandGraph.first + "\n";
    tree += operandGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> LogicEq::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "LogicEq_" + id;
  std::string tree = root + " [label = LogicEq]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> LogicNotEq::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "LogicNotEq_" + id;
  std::string tree = root + " [label = LogicNotEq]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> LogicLessThan::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "LogicLessThan_" + id;
  std::string tree = root + " [label = LogicLessThan]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> LogicLessEq::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "LogicLessEq_" + id;
  std::string tree = root + " [label = LogicLessEq]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> LogicGreaterThan::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "LogicGreaterThan_" + id;
  std::string tree = root + " [label = LogicGreaterThan]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> LogicGreaterEq::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "LogicGreaterEq_" + id;
  std::string tree = root + " [label = LogicGreaterEq]\n";

  // lhs_
  if (lhs_ != nullptr) {
    std::pair<std::string, std::string> lhsGraph = lhs_->genGraph();
    tree += root + " -> " + lhsGraph.first + "\n";
    tree += lhsGraph.second;
  }

  // rhs_
  if (rhs_ != nullptr) {
    std::pair<std::string, std::string> rhsGraph = rhs_->genGraph();
    tree += root + " -> " + rhsGraph.first + "\n";
    tree += rhsGraph.second;
  }

  return std::make_pair(root, tree);
}

std::pair<std::string, std::string> TernaryCondition::genGraph() {
  std::string id = std::to_string(reinterpret_cast<uintptr_t>(this));
  std::string root = "TernaryCondition_" + id;
  std::string tree = root + " [label = TernaryCondition]\n";

  // condition_
  if (condition_ != nullptr) {
    std::pair<std::string, std::string> conditionGraph = condition_->genGraph();
    tree += root + " -> " + conditionGraph.first + "\n";
    tree += conditionGraph.second;
  }

  // trueExpr_
  if (trueExpr_ != nullptr) {
    std::pair<std::string, std::string> trueExprGraph = trueExpr_->genGraph();
    tree += root + " -> " + trueExprGraph.first + "\n";
    tree += trueExprGraph.second;
  }

  // falseExpr_
  if (falseExpr_ != nullptr) {
    std::pair<std::string, std::string> falseExprGraph = falseExpr_->genGraph();
    tree += root + " -> " + falseExprGraph.first + "\n";
    tree += falseExprGraph.second;
  }

  return std::make_pair(root, tree);
}

}  // namespace AST