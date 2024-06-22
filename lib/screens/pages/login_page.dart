import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/components/buttons.dart';
import 'package:flutter_firebase_app/components/square_tile.dart';
import 'package:flutter_firebase_app/components/textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          const SizedBox(height: 30),
          const Icon(
            Icons.lock,
            size: 90,
          ),
          const SizedBox(height: 30),
          Text("Welcome Back",
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              )),
          //Username Textfield
          const SizedBox(height: 20),
          MyTextField(
            obscureText: false,
            controller: usernameController,
            hintText: 'Username',
          ),

          const SizedBox(height: 10),
          MyTextField(
            obscureText: true,
            controller: passwordController,
            hintText: 'Password',
          ),

          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'ForgotPassword',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          SignInButton(onTap: signUserIn),

          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Or Continue With?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
                Expanded(
                    child: Divider(
                  thickness: 0.5,
                  color: Colors.grey[400],
                )),
              ],
            ),
          ),

          const SizedBox(height: 20),

          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SquareTile(imagePath: 'lib/images/google.png'),
              SizedBox(
                width: 10,
              ),
              SquareTile(imagePath: 'lib/images/apple.png'),
            ],
          ),

          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Not a Member?',
                style: TextStyle(color: Colors.grey[700]),
              ),
              const SizedBox(width: 4),
              const Text(
                'Register Now',
                style: TextStyle(
                    color: Colors.blueAccent, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
