import 'package:cloud_firestore/cloud_firestore.dart';

import 'DadosProduto.dart';

class ProdCarrinho {
  String id;
  String category;
  String pId;
  int qtd;

  DadosProduto prodCarrinho;

  ProdCarrinho();

  ProdCarrinho.fromDocument(DocumentSnapshot document){
    id = document.documentID;
    category = document.data["category"];
    pId = document.data["pid"];
    qtd = document.data["qtd"];
  }

  Map<String, dynamic> toMap(){
    return {
      "category": category,
      "pid": pId,
      "qtd": qtd,
      //"products": prodCarrinho.toResumeMap(),
    };
  }
}