import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_ui_with_firebase/Screens/Login_Screen.dart';
import 'package:instagram_ui_with_firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instagram_ui_with_firebase/Screens/DataScreen.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  var email = TextEditingController();
  var password = TextEditingController();
  var name = TextEditingController();
  String Stringpurfiers(String email){
    String emails = email.replaceAll('.', ',') ;
    return emails ;
  }
  void register(String email, String password,String name) async {
    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Enter email and password') ,
      backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      )
      );
      setState(() {

      });
    } else {
      var auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Register Successfully',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
      String uid = auth.user!.uid.toString() ;
      var ref = FirebaseDatabase.instance.ref('Users/$uid');
      await ref.set({
        'uid' : uid ,
        'Name' : name,
        'Email' : email ,
      }
      ) ;
      setState(() {
      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Datascreen(name: name.toString()))) ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('English', style: TextStyle(color: Colors.grey)),
                ),
                Icon(Icons.arrow_drop_down_sharp),
              ],
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Instagram',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ), // i did not find any similar font style of instagram
          SizedBox(height: 40),
          Container(
            width: 330,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 42,
                  child: TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      fillColor: Colors.grey.shade300,
                      filled: true,
                      labelText: 'Enter Your Full Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 42,
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      labelText: 'Enter Your Email',
                      fillColor: Colors.grey.shade300,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 42,
                  child: TextFormField(
                    obscureText: true,
                    obscuringCharacter: '*',
                    controller: password,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      labelText: 'Password',
                      fillColor: Colors.grey.shade300,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              register(email.text.toString(),password.text.toString(), name.text.toString() );
            },
            child: Container(
              width: 330,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 100.0),
            child: Row(
              children: [
                Text('Dont Have an account?'),
                SizedBox(width: 3),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen())) ;
                  },
                  child: Text('SignIn', style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
