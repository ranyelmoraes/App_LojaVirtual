import 'package:flutter/material.dart';
import 'package:loja_virtual/models/UserModel.dart';
import 'package:loja_virtual/screens/CriarContaScreen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  Widget _buildBodyBack() => Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 25, 25, 112),
            Color.fromARGB(255, 65, 105, 225),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Entrar"),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "CRIAR CONTA",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CriarContaScreen()));
              },
            )
          ],
        ),
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            if (model.isLoading)
              return Stack(
                children: <Widget>[
                  _buildBodyBack(),
                  Center(
                      child: CircularProgressIndicator(
                          backgroundColor: Theme.of(context).primaryColor)),
                ],
              );
            else
              return Stack(
                children: <Widget>[
                  _buildBodyBack(),
                  Form(
                    key: _formKey,
                    child: ListView(
                      padding: EdgeInsets.all(10.0),
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.person, color: Colors.white),
                              labelText: "E-mail: ",
                              labelStyle: TextStyle(
                                color: Colors.white,
                              )),
                          keyboardType: TextInputType.emailAddress,
                          validator: (text) {
                            if (text.isEmpty || !text.contains("@")) {
                              return "E-mail inválido!";
                            }
                          },
                        ),
                        Divider(),
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.lock, color: Colors.white),
                              labelText: "Senha: ",
                              labelStyle: TextStyle(
                                color: Colors.white,
                              )),
                          obscureText: true,
                          validator: (text) {
                            if (text.isEmpty || text.length < 8) {
                              return "Senha inválida!";
                            }
                          },
                        ),
                        Divider(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: FlatButton(
                            padding: EdgeInsets.zero,
                            child: Text(
                              "Esqueci minha senha",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Divider(),
                        SizedBox(
                          height: 45.0,
                          child: RaisedButton(
                            color: Theme.of(context).primaryColor,
                            child: Text(
                              "Entrar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {}

                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
          },
        ));
  }
}
