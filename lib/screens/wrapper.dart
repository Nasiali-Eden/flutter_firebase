import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/screens/authenticate/authenticate.dart';

class wrapper extends StatelessWidget {
  const wrapper({super.key});

  // return home or authenticate
  @override
  Widget build(BuildContext context) {
    return const Authenticate();
  }
}
