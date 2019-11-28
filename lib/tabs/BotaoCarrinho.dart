import 'package:flutter/material.dart';
import 'package:loja_virtual/screens/TelaCarrinho.dart';

class BotaoCarrinho extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.shopping_cart),
      onPressed: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => TelaCarrinho())
        );
      },
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
