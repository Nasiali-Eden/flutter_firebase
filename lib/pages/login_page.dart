import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/components/textfield.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
            children: [
          const SizedBox(height: 50),
          const Icon(
            Icons.lock,
            size: 100,
          ),
          const SizedBox(height: 50),
          Text("Welcome Back",
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              )),
          //Username Textfield
          const SizedBox(height: 25),
              MyTextField(),

              const SizedBox(height: 15),
              MyTextField(),
        ]),
      ),
    );
  }
}
