import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/Dados/DadosProduto.dart';
import 'package:loja_virtual/tabs/Produtos.dart';

class TelaCategoria extends StatelessWidget {

  final DocumentSnapshot snapshot;

  TelaCategoria(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text(snapshot.data["title"]),
          centerTitle: true,
        ),
        body: FutureBuilder<QuerySnapshot>(
          future: Firestore.instance.collection("produtos").document(snapshot.documentID).collection("itens").getDocuments(),
          builder: (context, snapshot){
            if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator());
            }
            else {
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                padding: EdgeInsets.all(4.0),
                itemBuilder: (context, index){
                    DadosProduto data = DadosProduto.fromDocument(snapshot.data.documents[index]);
                    data.category = this.snapshot.documentID;
                    return Produtos(data);
                },
              );
            }
          },
        )
      ),

    );
  }
}
