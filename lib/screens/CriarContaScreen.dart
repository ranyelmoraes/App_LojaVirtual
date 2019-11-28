import 'package:flutter/material.dart';
import 'package:loja_virtual/models/UserModel.dart';
import 'package:scoped_model/scoped_model.dart';

class CriarContaScreen extends StatefulWidget {
  @override
  _CriarContaScreenState createState() => _CriarContaScreenState();
}

class _CriarContaScreenState extends State<CriarContaScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
          title: Text("CRIAR CONTA"),
        ),
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model){
            if(model.isLoading)
              return Center(child: CircularProgressIndicator());

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
                            labelText: "Nome Completo: ",
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            )
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        keyboardType: TextInputType.text,
                        controller: _nameController,
                        validator: (text){
                          if(text.isEmpty){
                            return "Nome inválido!";
                          }
                        },
                      ),
                      Divider(),
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.email, color: Colors.white),
                            labelText: "E-mail: ",
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            )
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: (text){
                          if(text.isEmpty || !text.contains("@")){
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
                              color: Colors.grey,
                            )
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        obscureText: true,
                        controller: _passController,
                        validator: (text){
                          if(text.isEmpty || text.length < 8){
                            return "Senha inválida! Precisa ter mais de 7 dígitos!";
                          }
                        },
                      ),
                      Divider(),
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.add_location , color: Colors.white),
                            labelText: "Endereço: ",
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            )
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        controller: _addressController,
                        validator: (text){
                          if(text.isEmpty){
                            return "Endereço inválido!";
                          }
                        },
                      ),
                      Divider(),
                      SizedBox(
                        height: 45.0,
                        child: RaisedButton(
                          color: Theme.of(context).primaryColor,
                          child: Text(
                            "Criar conta",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            if(_formKey.currentState.validate()){
                              Map<String, dynamic> userData = {
                                "name": _nameController.text,
                                "email": _emailController.text,
                                "address": _addressController.text
                              };
                              model.SignUp(
                                userData: userData,
                                senha: _passController.text,
                                onSuccess: _onSuccess,
                                onFail: _onFail,
                              );
                            }
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
      _scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text("Usuário criado com sucesso!"),
            backgroundColor: Theme.of(context).primaryColor,
            duration: Duration(seconds: 2),
          )
      );
      Future.delayed(Duration(seconds: 2)).then((_){
          Navigator.of(context).pop();
      });
  }

  void _onFail(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Falha ao criar usuário!"),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        )
    );
  }
}

