import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class Otp extends StatefulWidget {
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  void initState() {
    super.initState();
    _listenOtp();
  }
  //final String signcode;
  //Otp(this.signcode);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text("OTP Verification"),
          /* leading: Icon(
            Icons.close,
            size: 30,
            color: Colors.black,
          ),*/
        ),
        body: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //new Image.asset('assets/images/phone1.jpg'),

              //   icon: Icon(Icons.cake),
              //  iconSize: _iconAnimation.value * 100,
              // onPressed: () {}
              // new FlutterLogo(
              //size: 100.0,
              //  size: _iconAnimation.value * 100,

              new Text(
                "OTP Verification",
                style: new TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              // new Divider(),
              new Padding(
                padding: const EdgeInsets.only(top: 20.0),
              ),

              new Text(
                "Enter the otp sent to",
                style: new TextStyle(
                  fontSize: 16,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                //child: InkWell(
                // onTap: () {

                // Navigator.of(context).pushNamed("/dashboard");

                //Navigator.of(context).pushNamed("/dashboard");
                // handle your image tap here
                child: PinFieldAutoFill(
                    codeLength: 4,
                    onCodeChanged: (val) {
                      print(val);
                    }),
              ),

              new Padding(
                padding: const EdgeInsets.only(top: 20.0),
              ),
              new MaterialButton(
                  height: 40.0,
                  minWidth: 110.0,
                  color: Colors.green,
                  textColor: Colors.white,
                  child: new Text("Verify",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  onPressed: () => {
                        Navigator.of(context).pushNamed("/dashboard")

                        //  ),
                        /* {
                        if(signcode==signcode)
                        {
                        Navigator.of(context).pushNamed("/dashboard")
                      }
                      else
                      {
                        print ('wrong otp')
                      }*/
                      }),
              new Padding(
                padding: const EdgeInsets.only(top: 20.0),
              ),

              new Text(
                "Didn't receive OTP?",
                style: new TextStyle(
                  fontSize: 16,
                ),
              ),
              new Text(
                "RESEND",
                style: new TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ));
  }

  void _listenOtp() async {
    await SmsAutoFill().listenForCode;
  }
}
