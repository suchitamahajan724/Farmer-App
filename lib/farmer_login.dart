import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'dart:convert';
import "package:http/http.dart" as http;
import 'dart:async';

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

Future<List<FarmerData>> fetchFarmerLogin(http.Client client) async {
  final response = await client.get('http://localhost:27871/api/FarmerData');

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseFarmerLogin, response.body);
}

class FarmerData {
  final int id;
  final int userId;
  final int satbara;
  final String email;
  final int mobile;
  // final String title;

  FarmerData({this.id, this.userId, this.satbara, this.email, this.mobile});

  factory FarmerData.fromJson(Map<String, dynamic> json) {
    return FarmerData(
      id: json['id'],
      userId: json['userId'],
      satbara: json['satabara'],
      email: json['email'],
      mobile: json['mobile'],
      // title: json['title'],
    );
  }
}

class FarmerLogin extends StatefulWidget {
  @override
  _FarmerLoginState createState() => _FarmerLoginState();
}

class _FarmerLoginState extends State<FarmerLogin> {
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
          title: new Text("Farmer's Login"),
        ),
        backgroundColor: Colors.white,
        body: new Stack(fit: StackFit.expand, children: [
          new Image(
            image: new AssetImage("assets/images/farmer-bg.jpg"),
            fit: BoxFit.cover,
            color: Colors.black12,
            colorBlendMode: BlendMode.darken,
          ),
          new Container(
              child: Expanded(
                  child: new Column(
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
                          new TextField(
                            //controller: t1,
                            decoration: new InputDecoration(
                              labelText: "Enter 7/12 Number",

                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              // controller: t1,
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          //    validator: MultiValidator([
                          //  RequiredValidator(errorText: "* Required"),
                          //  EmailValidator(errorText: "Enter valid email id"),
                          //])),
                          //validator:
                          // EmailValidator(errorText: 'Not a validate Email'),
                          //validator:validate_email(),
                          //validator: validatepass,

                          TextField(
                            // controller: t2,
                            decoration: new InputDecoration(
                              labelText: "Enter Mobile Number",
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              prefixText: '+91  ',
                              prefixStyle:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            keyboardType: TextInputType.number,
                            //obscureText: true,
                          ),
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

                          new Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                          ),
                          new RaisedButton(
                            // height: 40.0,
                            // minWidth: 110.0,
                            // color: Colors.blue,
                            //textColor: Colors.white,
                            child: new Text("Generate OTP",
                                style: TextStyle(
                                  fontSize: 20,
                                )),
                            onPressed: () async {
                              final signcode =
                                  await SmsAutoFill().getAppSignature;
                              print(signcode);
                              //  login(),
                              // login('username' == 'suchita25@gmail.com'),
                              Navigator.of(context).pushNamed("/otp");
                              // Navigator.of(context).pushNamed("/dashboard");
                            },
                            /*Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>/dashboard),*/
                            //validate(),

                            splashColor: Colors.redAccent,
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              new Text(
                                "Already User? ",
                                style: new TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              new MaterialButton(
                                  height: 30.0,
                                  minWidth: 60.0,
                                  color: Colors.red,
                                  textColor: Colors.white,
                                  child: new Text("Signin",
                                      style: TextStyle(
                                        fontSize: 20,
                                      )),
                                  onPressed: () => {
                                        Navigator.of(context)
                                            .pushNamed("/farmer_signin")
                                      }),
                            ],
                          ),

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
                        ],
                      ),
                    ),
                  ))
            ],
          )))
        ]));
  }
}
