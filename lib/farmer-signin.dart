import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import "package:http/http.dart" as http;
import 'dart:async';

class FarmerData {
  final int id;
  final int userId;
  //final int satbara;
  final String email;
  //final int mobile;
  // final String title;

  FarmerData({this.id, this.userId, this.email});

  factory FarmerData.fromJson(Map<String, dynamic> json) {
    return FarmerData(
      id: json['id'],
      userId: json['userId'],
      // satbara: json['satabara'],
      email: json['email'],
      //mobile: json['mobile'],
      // title: json['title'],
    );
  }
}

Future<List<FarmerData>> fetchFarmerLogin(http.Client client) async {
  final response = await client.get('http://localhost:27871/api/FarmerData');

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseFarmerLogin, response.body);
}

/*Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response =
      await client.get('https://jsonplaceholder.typicode.com/photos');

  return parsePhotos(response.body);
}*/
List<FarmerData> parseFarmerLogin(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<FarmerData>((json) => FarmerData.fromJson(json)).toList();
}

/*Future<List<FarmerData>> fetchFarmerData() async {
  final response = await http.get('http://localhost:27871/api/FarmerData');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return parseFarmerLogin(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to fetch details');
  }
}*/

class FarmerSignin extends StatefulWidget {
  @override
  _FarmerSigninState createState() => _FarmerSigninState();
}

class _FarmerSigninState extends State<FarmerSignin> {
  Future<FarmerData> futureFarmerData;
  @override
  /* void initState() {
    super.initState();
    futureFarmerData = fetchFarmerData() as Future<FarmerData>;
  }

  final TextEditingController t1 = new TextEditingController();
  final TextEditingController t2 = new TextEditingController();
  final TextEditingController t3 = new TextEditingController();*/

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: new Text("Farmer's Signin"),
        ),
        backgroundColor: Colors.black,
        body: new Stack(fit: StackFit.expand, children: [
          //new Image(
          //image: new AssetImage("assets/images/farmer-bg.jpg"),
          //fit: BoxFit.cover,
          //color: Colors.black12,
          // colorBlendMode: BlendMode.darken,
          //),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: [
              //  new IconButton(
              //   icon: new Image.asset('assets/icons/cake-login.png'),
              //   icon: Icon(Icons.cake),
              //  iconSize: _iconAnimation.value * 100,
              //  onPressed: () {}
              // new FlutterLogo(
              //size: 100.0,
              //  size: _iconAnimation.value * 100,
              //    ),
              new Form(
                  autovalidateMode: AutovalidateMode.always,
                  //  key: formkey,
                  child: Theme(
                    data: new ThemeData(
                        brightness: Brightness.dark,
                        primarySwatch: Colors.blue,
                        inputDecorationTheme: new InputDecorationTheme(
                            labelStyle: new TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ))),
                    child: Container(
                      padding: const EdgeInsets.all(40.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //    validator: MultiValidator([
                          //  RequiredValidator(errorText: "* Required"),
                          //  EmailValidator(errorText: "Enter valid email id"),
                          //])),
                          //validator:
                          // EmailValidator(errorText: 'Not a validate Email'),
                          //validator:validate_email(),
                          //validator: validatepass,

                          // validator: validatepass),
                          TextField(
                            //  controller: t3,
                            decoration: new InputDecoration(
                              labelText: "Enter Email Id",
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            //obscureText: true,
                          ),
                          new TextField(
                            //  controller: t2,
                            decoration: new InputDecoration(
                              labelText: "Enter password",
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            //    validator: validatepass
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                          ),
                          new MaterialButton(
                              height: 30.0,
                              minWidth: 60.0,
                              color: Colors.red,
                              textColor: Colors.white,
                              child: new Text("Login",
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                              onPressed: () => {
                                    Navigator.of(context)
                                        .pushNamed("/dashboard")
                                  }),

                          /*new RaisedButton(
                            child: new Text("Login",
                                style: TextStyle(
                                  fontSize: 20,
                                )),
                            onPressed: () {
                              //  login(),
                              // login('username' == 'suchita25@gmail.com'),
                              Navigator.of(context).pushNamed("/dashboard");
                            },
                            splashColor: Colors.redAccent,
                          ),*/

                          new Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                          ),
                          /* InkWell(
                    onTap: () {
                      // Navigator.of(context).pushNamed("/candles");
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("/create_new_account");
                    },
                    child: Text(
                      "Create new account",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),*/
                        ],
                      ),
                    ),
                  ))
            ],
          )
        ]));
  }
}
