import 'package:flutter/material.dart';
import 'package:instagram_ui_with_firebase/Screens/Login_Screen.dart';
import 'package:instagram_ui_with_firebase/Screens/Splash_Screen.dart';
import 'package:instagram_ui_with_firebase/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform) ;
  runApp(home()) ;
}
class home extends StatelessWidget {
  const home({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
