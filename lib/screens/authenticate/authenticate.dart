import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/screens/pages/login_page.dart';
import 'package:flutter_firebase_app/screens/pages/register_page.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showLoginPage = true;

  void toggleView(){
    setState(() => showLoginPage = !showLoginPage);
  }

  @override
  Widget build(BuildContext context) {

   if (showLoginPage) {
     return LoginPage(toggleView: toggleView);
   }
   else{
     return RegisterPage(toggleView: toggleView);
   }
  }
}
