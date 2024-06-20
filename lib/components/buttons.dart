import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  const SignInButton ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(color: Colors.black),
      child: const Center(
        child: Text("Sign In",
        style: TextStyle(color: Colors.white),),
      ),
    );
  }
}