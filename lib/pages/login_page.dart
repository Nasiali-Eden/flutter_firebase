import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/components/buttons.dart';
import 'package:flutter_firebase_app/components/textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn (){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(children: [
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
          MyTextField(
            obscureText: false,
            controller: usernameController,
            hintText: 'Username',
          ),

          const SizedBox(height: 15),
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

          const SizedBox(height: 50),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            children: [
              Expanded(child: Divider(
                thickness: 0.5,
                  color: Colors.grey[400],
              ),
              ),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Or Continue With?',
                style: TextStyle(color: Colors.grey[700]),
              ),),

              Expanded(
                child: Divider(
                  thickness: 0.5,
                  color: Colors.grey[400],
                )
              )
            ],
          ),),
        ]),
      ),
    );
  }
}
 