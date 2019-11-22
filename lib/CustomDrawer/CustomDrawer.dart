import 'package:flutter/material.dart';
import 'package:loja_virtual/BotaoDrawer/BotaoDrawer.dart';
import 'package:loja_virtual/screens/LoginScreen.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  CustomDrawer(this.pageController);

  Widget _buildDrawerBack() => Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 203, 236, 241),
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 8.0, 8.0),
                height: 170.0,
                child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 8.0,
                        left: 0.0,
                        child: Text("Água\n& Gás",
                        style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Olá,", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                            ),
                            GestureDetector(
                              child: Text(
                                "Entre ou cadastre-se >",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen()
                                    )
                                  );
                              },
                            )
                          ],
                        ),
                      )
                    ],
                ),
              ),
              Divider(),
              BotaoDrawer(Icons.home, "Início", pageController, 0),
              BotaoDrawer(Icons.list, "Produtos", pageController, 1),
              BotaoDrawer(Icons.add_location, "Encontre uma loja", pageController, 2),
              BotaoDrawer(Icons.playlist_add_check, "Meus Pedidos", pageController, 3),
            ],
          )
        ],
      ),
    );
  }
}
