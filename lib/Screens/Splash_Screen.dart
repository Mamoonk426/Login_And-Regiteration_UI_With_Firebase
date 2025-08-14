import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_ui_with_firebase/Screens/Login_Screen.dart';
import 'package:instagram_ui_with_firebase/Screens/splash_services.dart';
import 'package:instagram_ui_with_firebase/firebase_options.dart';
import 'package:instagram_ui_with_firebase/Screens/DataScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Splashservices splashservices = Splashservices() ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState() ;
    splashservices.router(context) ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
             Center(
              child: Icon(Icons.login_outlined,color: Colors.blue,size: 70) ,
            ),

        ],
      ),
    );
  }
}
