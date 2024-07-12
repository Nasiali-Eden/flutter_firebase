import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/Loading/load.dart';
import 'package:flutter_firebase_app/components/buttons.dart';
import 'package:flutter_firebase_app/components/square_tile.dart';
import 'package:flutter_firebase_app/components/textfield.dart';
import 'package:flutter_firebase_app/screens/services/auth.dart';

class LoginPage extends StatefulWidget {
  final Function toggleView;
  LoginPage({super.key, required this.toggleView});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthService _auth = AuthService();

  bool loading = false;

  void signUserIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
     loading = true;
      });
      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
      if(result == null){
        setState(() {
          error = 'Could not Sign In with those Credentials';
          loading = false;
        });
      }
    }
  }
  String error = '';
  String email = '';
  String password = '';

  void _onEmailChanged(String value) {
    setState(() {
      email = value;
    });
  }

  void _onPasswordChanged(String value) {
    setState(() {
      password = value;
    });
  }

  Future<void> signInAnon() async {
    dynamic result = await _auth.signAnon();
    if (result == null) {
      print('error');
    } else {
      print('signed in');
      print("user " + result.uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading ? const Load() : Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Center(
          child: Text('Sign In'),
        ),
        actions: [
          TextButton.icon(
            icon: Icon(Icons.person, color: Colors.grey[500],),
            label: const Text("Register"),
            onPressed: () {
               widget.toggleView();
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const Icon(
                Icons.lock,
                size: 90,
              ),
              const SizedBox(height: 0),
              SignInAnon(onPressed: signInAnon),
              const SizedBox(height: 1),
              MyTextField(
                validator: (value) =>
                value!.isEmpty ? 'Enter an email' : null,
                obscureText: false,
                controller: usernameController,
                hintText: 'Enter Your Email',
                onChanged: _onEmailChanged,
              ),
              const SizedBox(height: 10),
              MyTextField(
                validator: (value) =>
                value!.length < 6 ? 'Enter a password 6+ characters long' : null,
                obscureText: true,
                controller: passwordController,
                hintText: 'Password',
                onChanged: _onPasswordChanged,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              SignInButton(onPressed: signUserIn),

              Text(error, style: const TextStyle(color: Colors.deepOrange,fontSize: 14.0),),
              const SizedBox(height: 15),
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
                        'Or Continue With',
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
              const SizedBox(height: 10),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
