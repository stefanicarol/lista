import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: DrawerScreen(),
      appBar: AppBar(
        title: Text('Listas Compartilhadas'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.monetization_on),
                      color: Colors.deepPurple,
                      iconSize: 100,
                      onPressed: () {},
                    ),
                    Text('Listas de Contas')
                  ],
                ),
                Container(
                  width: 30,
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.library_books),
                      color: Colors.deepPurple,
                      iconSize: 100,
                      onPressed: () {
                        Modular.to.pushNamed("/list");
                      },
                    ),
                    Text('Listas de Compras'),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.format_list_numbered),
                      color: Colors.deepPurple,
                      iconSize: 100,
                      onPressed: () {
                        Modular.to.pushNamed("/item");
                      },
                    ),
                    Text('Lista de Lembretes'),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
