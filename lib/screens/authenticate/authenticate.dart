import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/screens/pages/login_page.dart';
import 'package:flutter_firebase_app/screens/pages/register_page.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const RegisterPage(),
    );
  }
}
