import "package:flutter/material.dart";
import 'package:loginwithmob_flutter/farmer-signin.dart';
import 'dashboard.dart';
import 'dealer_login.dart';
import 'dealer_signin.dart';
import 'farmer_login.dart';
import 'otp.dart';
//import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // final Future<List<FarmerLogin>> FarmerLogin;
  // MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Future<Album> futureAlbum;
  @override
  // void initState() {
  //  super.initState();
  //  futureAlbum = fetchAlbum();
  // }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Agriculture App',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Home(),
        routes: <String, WidgetBuilder>{
          "/farmer_login": (BuildContext context) => new FarmerLogin(),
          "/dealer_login": (BuildContext context) => new DealerLogin(),
          "/otp": (BuildContext context) => new Otp(),
          "/dashboard": (BuildContext context) => new Dashboard(),
          "/farmer_signin": (BuildContext context) => new FarmerSignin(),
          "/dealer_signin": (BuildContext context) => new DealerSignin(),
        });
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Agriculture App",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: new Stack(fit: StackFit.expand, children: [
          new Image(
            image: new AssetImage("assets/images/bg2.jpg"),
            fit: BoxFit.cover,
            color: Colors.black12,
            colorBlendMode: BlendMode.darken,
          ),
          new Container(
            padding: EdgeInsets.only(bottom: 290),
            alignment: Alignment.center,
            child: new Text(
              "Select Login from here",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            ),
          ),
          //  Padding(padding: EdgeInsets.only(top: 0)),
          Container(
            padding: EdgeInsets.only(bottom: 180),
            alignment: Alignment.center,

            //  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 00),
            //padding: EdgeInsets.all(100.0),
            child: DropdownButton(
                iconEnabledColor: Colors.green,
                iconDisabledColor: Colors.blue,
                iconSize: 70,
                value: _value,
                dropdownColor: Colors.black45,
                // isExpanded: true,
                items: [
                  DropdownMenuItem(
                    child: Text(
                      "Farmer",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Dealer",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    value: 2,
                  ),
                  // DropdownMenuItem(child: Text("Third Item"), value: 3),
                  // DropdownMenuItem(child: Text("Fourth Item"), value: 4)
                ],
                onChanged: (value) {
                  setState(() {
                    _value = value;
                    if (value == 1) {
                      Navigator.of(context).pushNamed("/farmer_login");
                      print('Farmer login');
                    } else {
                      Navigator.of(context).pushNamed("/dealer_login");
                      print("Dealer Login");
                    }
                  });
                }),
          )
        ]));
  }
}
/*class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
            child: Text("Login"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (c) => Otp()));
            }),
      ),
    );
  }
}
*/
