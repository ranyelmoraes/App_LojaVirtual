import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/Dados/DadosProduto.dart';
import 'package:loja_virtual/screens/TelaDoProduto.dart';

class Produtos extends StatelessWidget {

  final DadosProduto produto;

  Produtos(this.produto);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => TelaDoProduto(produto)));
      },
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Image.network(
              produto.images[0],
              fit: BoxFit.cover,
              height: 250.0,
            ),
          ),
          Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(left: 45.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      produto.title,
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "R\$ ${produto.price.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
