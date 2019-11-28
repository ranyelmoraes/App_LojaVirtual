import 'package:flutter/material.dart';
import 'package:loja_virtual/models/UserModel.dart';
import 'package:loja_virtual/screens/CriarContaScreen.dart';
import 'package:loja_virtual/screens/HomeScreen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _passController = TextEditingController();
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
        )
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                          controller: _emailController,
                          decoration: InputDecoration(
                              icon: Icon(Icons.person, color: Colors.white),
                              labelText: "E-mail: ",
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                          ),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (text) {
                            if (text.isEmpty || !text.contains("@")) {
                              return "E-mail inválido!";
                            }
                          },
                        ),
                        Divider(),
                        TextFormField(
                          controller: _passController,
                          decoration: InputDecoration(
                              icon: Icon(Icons.lock, color: Colors.white),
                              labelText: "Senha: ",
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              )
                          ),
                          style: TextStyle(
                            color: Colors.white,
                          ),
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
                            onPressed: () {
                              if(_emailController.text.isEmpty == 0){
                                _scaffoldKey.currentState.showSnackBar(
                                    SnackBar(content: Text("Insira seu e-mail para recuperação de senha!"),
                                      backgroundColor: Colors.redAccent,
                                      duration: Duration(seconds: 2),
                                    )
                                );
                              }
                              else {
                                model.recoverPass(_emailController.text);
                                _scaffoldKey.currentState.showSnackBar(
                                    SnackBar(content: Text("Enviamos uma mensagem para seu e-mail, verifique-o."),
                                      backgroundColor: Colors.redAccent,
                                      duration: Duration(seconds: 2),
                                    )
                                );
                              }
                            },
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
                              if (_formKey.currentState.validate()) {

                              }
                              model.signIn(
                                email: _emailController.text,
                                senha: _passController.text,
                                onFail: _onFail,
                                onSuccess: _onSuccess,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
          },
        )
    );
  }
  void _onSuccess(){
    Navigator.of(context).pop();
  }

  void _onFail(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Falha ao entrar!"),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        )
    );
  }

}
