import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

List<DealerData> parseDealerLogin(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<DealerData>((json) => DealerData.fromJson(json)).toList();
}

/*Future<List<DealerData>> fetchPhotos(http.Client client) async {
  final response =
      await client.get('https://localhost:27871/api/DealerData');

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseDealerLogin, response.body);
}*/

/*Future<List<DealerData>> fetchDealerData() async {
  final response = await http.get('http://localhost:27871/api/DealerData');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //  return compute(parseDealerLogin, response.body);

    return parseDealerLogin(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to fetch details');
  }
}*/
Future<List<DealerData>> fetchDealerLogin(http.Client client) async {
  final response = await client.get('http://localhost:27871/api/DealerData');

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseDealerLogin, response.body);
}

class DealerData {
  final int id;
  final int dealerId;
  final String dealername;
  final String address;
  final int code;
  final int mobileno;
  final String email;
  // final String title;

  DealerData(
      {this.id,
      this.dealerId,
      this.dealername,
      this.address,
      this.code,
      this.mobileno,
      this.email});

  factory DealerData.fromJson(Map<String, dynamic> json) {
    return DealerData(
      id: json['id'],
      dealerId: json['dealerId'],
      dealername: json['dealername'],
      address: json['address'],
      code: json['code'],
      mobileno: json['mobileno'],
      email: json['email'],

      // title: json['title'],
    );
  }
}

class DealerLogin extends StatefulWidget {
  @override
  _DealerLoginState createState() => _DealerLoginState();
}

class _DealerLoginState extends State<DealerLogin> {
  Future<DealerData> futureDealerData;
  @override
  //void initState() {
  //  super.initState();
  //   futureDealerData = fetchDealerData() as Future<DealerData>;
//  }

  //final TextEditingController t1 = new TextEditingController();
  // final TextEditingController t2 = new TextEditingController();
  // final TextEditingController t3 = new TextEditingController();
  // final TextEditingController t4 = new TextEditingController();
  //final TextEditingController t5 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Dealer's Login"),
      ),
      backgroundColor: Colors.white,
      body: new Stack(fit: StackFit.expand, children: [
        new Image(
          image: new AssetImage("assets/images/dealer-bg.jpg"),
          fit: BoxFit.cover,
          color: Colors.black12,
          colorBlendMode: BlendMode.darken,
        ),
        new SingleChildScrollView(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: [
              new Padding(
                padding: const EdgeInsets.only(top: 40.0),
              ),

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
                  //   autovalidateMode: AutovalidateMode.always,
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
                        padding: const EdgeInsets.all(20.0),
                        child: Flex(
                          direction: Axis.horizontal,
                          children: ([
                            Expanded(
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  new TextField(
                                    // controller: t1,
                                    decoration: new InputDecoration(
                                      labelText: "Enter Dealer Name",
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),

                                      // controller: t1,
                                    ),
                                    keyboardType: TextInputType.text,
                                  ),
                                  //  validator: MultiValidator([
                                  //    RequiredValidator(errorText: "* Required"),
                                  //   EmailValidator(errorText: "Enter valid email id"),
                                  // ])),
                                  //validator:
                                  //  EmailValidator(errorText: 'Not a validate Email'),
                                  // validator:validate_email(),
                                  // validator: validatepass,
                                  TextField(
                                    //controller: t2,
                                    decoration: new InputDecoration(
                                      labelText: "Enter Dealer Code",
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),

                                      // prefixText: '+91  ',
                                      // prefixStyle: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    keyboardType: TextInputType.number,
                                    //obscureText: true,
                                  ),
                                  TextField(
                                    //controller: t3,
                                    decoration: new InputDecoration(
                                      labelText: "Enter Mobile Number",
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                      prefixText: '+91  ',
                                      prefixStyle: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    keyboardType: TextInputType.number,
                                    //obscureText: true,
                                  ),
                                  // validator: validatepass),
                                  TextField(
                                    //controller: t4,
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
                                    //controller: t5,
                                    decoration: new InputDecoration(
                                      labelText: "Enter Dealer Address",
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),

                                      // controller: t1,
                                    ),
                                    keyboardType: TextInputType.text,
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
                                    },
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
                                                    .pushNamed("/dealer_signin")
                                              }),
                                    ],
                                  ),

                                  new Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      )))
            ],
          ),
        )
      ]),
    );
  }
}
