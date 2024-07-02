import 'package:flutter/material.dart';
import '../../components/buttons.dart';
import '../../components/square_tile.dart';
import '../../components/textfield.dart';
import '../services/auth.dart';

    class RegisterPage extends StatefulWidget {
      final Function toggleView;
      RegisterPage({Key? key,required this.toggleView}) : super(key:key);

      @override
      State<RegisterPage> createState() => _RegisterPageState();
    }

    class _RegisterPageState extends State<RegisterPage> {

      final usernameController = TextEditingController();
      final passwordController = TextEditingController();
      final AuthService _auth = AuthService();

      String email = '';
      String password = '';

      void SignUp(){
        print(email);
        print(password);
      }

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
      @override
      Widget build(BuildContext context) {
        return  Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: const Center(child: Text('Sign Up')
            ),
            actions: [
              TextButton.icon(
                icon: Icon(Icons.person),
                label: Text("Sign In"),
                onPressed: () {
                  widget.toggleView();
                },
              ),
            ],
          ),
          body: Form(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const Icon(
                    Icons.lock,
                    size: 90,
                  ),
                  const SizedBox(height: 1),
                  MyTextField(
                    obscureText: false,
                    controller: usernameController,
                    hintText: 'Enter Your Email',
                    onChanged: _onEmailChanged,
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
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
                  SignUpButton(onPressed: SignUp),
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
                        'Already Have an Account?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Sign In',
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
