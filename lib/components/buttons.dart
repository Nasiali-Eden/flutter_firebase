import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
<<<<<<< HEAD
  final Function()? onTap;

  const SignInButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            "Sign In",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16
            ),
          ),
        ),
      ),
    );
  }
}
=======
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
>>>>>>> 13bb9930ce2cdc0f6cce0f9950e1fe7647bceaa8
