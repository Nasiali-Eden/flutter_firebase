import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/screens/authenticate/authenticate.dart';
import 'package:flutter_firebase_app/screens/home/home.dart';

class wrapper extends StatelessWidget {
  const wrapper({super.key});

  // return home or authenticate
  @override
  Widget build(BuildContext context) {
    return Authenticate();
  }
}
