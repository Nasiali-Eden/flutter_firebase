import 'package:flutter/material.dart';
import '../../components/textfield.dart'; // Adjust the import path as needed

class RegisterPage extends StatefulWidget {
  final Function toggleView;

  const RegisterPage({
    super.key,
    required this.toggleView,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String email = '';
  String password = '';

  void SignUp() {
    if (_formKey.currentState!.validate()) {
      // Validation succeeded, perform actions
      print('Email: $email');
      print('Password: $password');
      // Call your authentication service or any other logic here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Center(
          child: Text('Sign Up'),
        ),
        actions: [
          TextButton.icon(
            icon: Icon(Icons.person, color: Colors.grey[500]),
            label: const Text("Sign In"),
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
              const SizedBox(height: 10),
              MyTextField(
                validator: (value) =>
                value!.isEmpty ? 'Enter an email' : null,
                obscureText: false,
                controller: usernameController,
                hintText: 'Enter Your Email',
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              MyTextField(
                validator: (value) =>
                value!.length < 6 ? 'Enter a password 6+ characters long' : null,
                obscureText: true,
                controller: passwordController,
                hintText: 'Password',
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
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

              ElevatedButton(
                onPressed: SignUp,
                child: const Text('Sign Up'),
              ),

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
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Replace with your social login widgets
                  Text('Social Login Buttons Here'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already Have an Account?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold),
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
