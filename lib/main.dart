import 'package:flutter/material.dart';
import 'package:loja_virtual/models/UserModel.dart';
import 'package:loja_virtual/screens/HomeScreen.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
        theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color.fromARGB(255, 25, 25, 112),
    ),
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
    ));
  }
}