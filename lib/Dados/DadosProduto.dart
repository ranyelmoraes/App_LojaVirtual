import 'package:cloud_firestore/cloud_firestore.dart';

class DadosProduto {

  String description;
  String title;
  String id;
  String category;
  double price;
  List images;


  DadosProduto.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    description = snapshot.data["description"];
    title = snapshot.data["title"];
    category = snapshot.data["category"];
    price = snapshot.data["price"];
    images = snapshot.data["images"];
  }
  Map<String, dynamic> toResumeMap(){
    return {
      "title": title,
      "description": description,
      "price": price,
    };
  }
}