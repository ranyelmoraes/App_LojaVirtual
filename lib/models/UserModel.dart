import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;

  Map<String, dynamic> userData = Map();

  bool isLoading = false;


  void SignUp({@required Map<String, dynamic> userData,@required String senha,
      @required VoidCallback onSucess,@required VoidCallback onFail}) {
    isLoading = true;
    notifyListeners();

    _auth.createUserWithEmailAndPassword(
        email: userData["email"],
        password: senha
    ).then((user) async {
      await _saveUserData(userData);

      firebaseUser = user;
      onSucess();
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      onFail();
      isLoading = false;
      notifyListeners();
    });

    void SignIn() async {
      isLoading = true;
      notifyListeners();

      await Future.delayed(Duration(seconds: 3));
      isLoading = false;
      notifyListeners();
    }

    void RecoverPass() {

    }

    bool isLoggedIn() {

    }
  }
  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await Firestore.instance.collection("usuarios").document(firebaseUser.uid).setData(userData);
  }
}