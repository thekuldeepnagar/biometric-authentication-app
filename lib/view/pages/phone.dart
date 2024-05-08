

import 'package:biometricauthentication/view/pages/otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneScreen extends StatefulWidget
{
  @override
  State<PhoneScreen> createState() => _PhoneScreenstate();

  static String verify="";


}
class _PhoneScreenstate extends State<PhoneScreen>
{


  var phone="";
  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      appBar: AppBar(
        title: Text("Phone"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                keyboardType: TextInputType.phone,
                onChanged: (value){phone=value;},
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                  ),
                  hintText: "Phone"
                ),
              ),
            ),
          ),


          ElevatedButton(onPressed: () async
          {

            await FirebaseAuth.instance.verifyPhoneNumber(
              phoneNumber: '+91$phone',
              verificationCompleted: (PhoneAuthCredential credential) {},
              verificationFailed: (FirebaseAuthException e)
              {
                print("ndsd$e");
              },
              codeSent: (String verificationId, int? resendToken)
              {
                print("hi this is ");
                print(verificationId);
                PhoneScreen.verify=verificationId;
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OtpScreen()));
              },
              codeAutoRetrievalTimeout: (String verificationId) {},
            );

            //
          },
          child: Text("Send"))
        ],
      )
    );

  }


}