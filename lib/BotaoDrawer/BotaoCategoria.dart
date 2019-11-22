import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/screens/TelaCategoria.dart';

class BotaoCategoria extends StatelessWidget {
  final DocumentSnapshot snapshot;

  BotaoCategoria(this.snapshot);

  @override
  Widget build(BuildContext context) {

    Widget _buildBodyBack() => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 25, 25, 112),
              Color.fromARGB(255, 65, 105, 225),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
      ),
    );

    return ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(snapshot.data["icon"]),
          ),
          title: Text(snapshot.data["title"],
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              )),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TelaCategoria(snapshot)));
          },
    );
  }
}
