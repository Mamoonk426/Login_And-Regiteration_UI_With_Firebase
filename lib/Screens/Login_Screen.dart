import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instagram_ui_with_firebase/Screens/Register_Screen.dart';
import 'package:instagram_ui_with_firebase/firebase_options.dart';
import 'package:instagram_ui_with_firebase/Screens/DataScreen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var email = TextEditingController();
  var password = TextEditingController();
  void login(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          content: Text('Enter Email And Password'),
        ),
      );
      setState(() {

      });
    } else {
      var auth = FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green,
          content: Text('Login Successfully')));
      setState(() {

      });
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Datascreen(name: '',))) ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: SingleChildScrollView(
        child: Column(
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
            ), // i did not find any similar font to instagram
            SizedBox(height: 30),
            Container(
              width: 330,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              child: Row(
                children: [
                  SizedBox(width: 50),
                  Icon(Icons.facebook, color: Colors.white),
                  SizedBox(width: 20),
                  Text(
                    'Continue With Facebook',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
            Row(
              children: [
                SizedBox(width: 20),
                Expanded(
                  flex: 2,
                  child: Container(width: 150, height: 1, color: Colors.grey),
                ),
                SizedBox(width: 30),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Text('OR', style: TextStyle(color: Colors.grey)),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(width: 150, height: 2, color: Colors.grey),
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 40),
            Container(
              width: 330,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 42,
                    child: TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        labelText: 'Enter Phone Number Or Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 42,
                    child: TextFormField(
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
            SizedBox(height: 2),
            Padding(
              padding: EdgeInsets.only(left: 200),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password ?',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                login(email.text.toString(), password.text.toString());
              } ,
              child: Container(
                width: 330,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Login',
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterScreen()),
                      );
                    },
                    child: Text('Sign Up', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
