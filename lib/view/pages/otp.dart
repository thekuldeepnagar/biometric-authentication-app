

import 'package:biometricauthentication/view/pages/faceauthentication.dart';
import 'package:biometricauthentication/view/pages/phone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget
{
  @override
  State<OtpScreen> createState() => _OtpScreenstate();


}
class _OtpScreenstate extends State<OtpScreen>
{
  FirebaseAuth auth = FirebaseAuth.instance;

  var code="";

  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text("Otp"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Pinput(
                  length: 6,
                  showCursor: true,
                  onChanged: (value){
                    code=value;
                  },
                ),
              ),
            ),
            ElevatedButton(onPressed: () async
            {
              try
              {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: PhoneScreen.verify, smsCode: code);
                await auth.signInWithCredential(credential);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FaceAuthentication()));
              }
              catch(e)
              {
                print(e);
              }
            }, child: Text("Verify number"))
          ],
        )
    );

  }


}