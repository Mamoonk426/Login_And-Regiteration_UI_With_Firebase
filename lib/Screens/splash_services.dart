import 'package:flutter/material.dart';
import 'package:instagram_ui_with_firebase/Screens/Login_Screen.dart';
import 'package:instagram_ui_with_firebase/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instagram_ui_with_firebase/Screens/DataScreen.dart';
class Splashservices{
  void router(BuildContext context)async{
    await Future.delayed(Duration(seconds: 5)) ;
    final user = await FirebaseAuth.instance.authStateChanges().first ;
    if(!context.mounted) return ;
    if(user!=null){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Datascreen(name: user.uid))) ;
    }else{
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen())) ;
    }
  }
  }
