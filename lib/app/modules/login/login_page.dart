import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/pasta-compartilhada.png",
              width: 210,
              height: 210,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "MyShared Lists",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: "Roboto",
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 50,
              height: 50,
            ),
            RaisedButton(
                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(30),
                ),
                onPressed: controller.loginWithGoogle,
                child: Text(
                  '  Login com Google  ',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                color: Colors.blue[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(30),
                ),
                onPressed: () {},
                child: Text(
                  'Login com Facebook',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(30),
                ),
                onPressed: () {},
                child: Text(
                  '  Login com Twitter  ',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
          ],
        ),
      ),
    );
  }
}
