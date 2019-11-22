import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/Dados/DadosProduto.dart';

class TelaDoProduto extends StatefulWidget {
  final DadosProduto produto;

  TelaDoProduto(this.produto);

  @override
  _TelaDoProdutoState createState() => _TelaDoProdutoState(produto);
}

class _TelaDoProdutoState extends State<TelaDoProduto> {
  @override
  final DadosProduto produto;

  _TelaDoProdutoState(this.produto);

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(produto.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 400.0,
              child: Image.network(produto.images[0]),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text("${produto.title}",
                      style:
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 22.0)
                  ),
                  Divider(height: 8.0),
                  Text("R\$ ${produto.price}",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 22.0,
                      )
                  ),
                  Divider(),
                  Container(
                    height: 45.0,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      child: Text("Adicionar ao Carrinho",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )),
                      onPressed: () {},
                    ),
                  ),
                  Divider(height: 8.0),
                  Text("Descrição",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      )
                  ),
                  Text(
                    "${produto.description}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
