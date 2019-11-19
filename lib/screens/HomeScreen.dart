import 'package:flutter/material.dart';
import 'package:loja_virtual/CustomDrawer/CustomDrawer.dart';
import 'package:loja_virtual/tabs/HomeTab.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _pageController = PageController();

    return PageView(
      controller: _pageController ,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
       Scaffold(
         body: HomeTab(),
         drawer: CustomDrawer(),
       ),
      ],
    );
  }
}
