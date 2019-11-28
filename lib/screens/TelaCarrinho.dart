import 'package:flutter/material.dart';
import 'package:loja_virtual/models/CarrinhoModel.dart';
import 'package:loja_virtual/models/UserModel.dart';
import 'package:loja_virtual/screens/LoginScreen.dart';
import 'package:scoped_model/scoped_model.dart';

class TelaCarrinho extends StatefulWidget {
  @override
  _TelaCarrinhoState createState() => _TelaCarrinhoState();
}

class _TelaCarrinhoState extends State<TelaCarrinho> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu Carrinho"),
        actions: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 8.0),
            child: ScopedModelDescendant<CarrinhoModel>(
                builder: (context, child, model){
                    int p = model.products.length;
                    return Text(
                      "${p ?? 0} ${p == 1 ? "ITEM" : "ITENS"}",
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    );
                }),
          )
        ],
      ),
      body: ScopedModelDescendant<CarrinhoModel>(
          builder: (context, child, model){
            if(model.isLoading && UserModel.of(context).isLoggedIn()){
               return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(!UserModel.of(context).isLoggedIn()){
              return Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.remove_shopping_cart, size: 32.0, color: Theme.of(context).primaryColor),
                    Text("Precisa estar logado para adicionar produtos no carrinho!", style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    RaisedButton(
                      child: Text("Entrar", style: TextStyle(
                        color: Colors.white,
                      ),
                      ),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                    )
                  ],
                ),
              );
            }
          }

          ),
    );
  }
}
