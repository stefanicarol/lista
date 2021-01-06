import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: DrawerScreen(),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            UserAccountsDrawerHeader(
              accountName: new Text(controller.auth.user.displayName),
              accountEmail: new Text(controller.auth.user.email),
              arrowColor: Colors.blueGrey,
              currentAccountPicture: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  controller.auth.user.photoURL,
                ),
              ),
              otherAccountsPictures: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    controller.auth.logoff();
                    controller.logoff();
                  },
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.library_books),
                      color: Colors.blueGrey,
                      iconSize: 50,
                      onPressed: () {
                        Modular.to.pushNamed("/list");
                      },
                    ),
                    Text('Minhas Listas'),
                  ],
                ),
                Container(
                  width: 30,
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.share),
                      color: Colors.blueGrey,
                      iconSize: 50,
                      onPressed: () {
                        Modular.to.pushNamed("/share");
                      },
                    ),
                    Text('Compartilhadas')
                  ],
                ),
              ],
            ),
            /* Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.format_list_numbered),
                      color: Colors.blueGrey,
                      iconSize: 50,
                      onPressed: () {},
                    ),
                    Text('Lista de Lembretes'),
                  ],
                )
              ],
            ),*/
          ],
        ),
      ),
    );
  }
}
