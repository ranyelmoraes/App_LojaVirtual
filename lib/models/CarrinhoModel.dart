import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:loja_virtual/Dados/ProdCarrinho.dart';
import 'package:loja_virtual/models/UserModel.dart';
import 'package:scoped_model/scoped_model.dart';

class CarrinhoModel extends Model{
  List <ProdCarrinho> products = [];

  UserModel user;

  CarrinhoModel(this.user);

  bool isLoading = false;

  static CarrinhoModel of(BuildContext context) =>
      ScopedModel.of<CarrinhoModel>(context);

  void addProd(ProdCarrinho prodCarrinho){
    products.add(prodCarrinho);
    
    Firestore.instance.collection("usuarios").document(user.firebaseUser.uid)
        .collection("carrinho").add(prodCarrinho.toMap()).then((doc){
          prodCarrinho.id = doc.documentID;
    });

    notifyListeners();
  }

  void removeProd(ProdCarrinho prodCarrinho){
    Firestore.instance.collection("usuarios").document(user.firebaseUser.uid)
        .collection("carrinho").document(prodCarrinho.id).delete();

    products.remove(prodCarrinho);
    notifyListeners();
  }
}