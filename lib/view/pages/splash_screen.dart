

import 'dart:async';

import 'package:biometricauthentication/view/pages/biometric_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget
{
  @override
  State<SplashScreen> createState() => _SplashScreenstate();


}
class _SplashScreenstate extends State<SplashScreen>
{


  void initState()
  {
    super.initState();
    Timer(Duration(seconds: 3), ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(title: "This is Biometric tab")))
    );
  }

  @override
  Widget build(BuildContext context)
  {


    return Scaffold(

      body: Center(
        child: Text("Flutter Experimental \n Research",textAlign: TextAlign.center,style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20

          ),
        ),
      ),

    );



  }



}