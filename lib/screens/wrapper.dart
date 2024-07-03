import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:flutter_firebase_app/screens/home/home.dart';
import 'package:flutter_firebase_app/models/user.dart';

class Wrapper extends StatelessWidget {
  final bool firebaseInitialized;
  const Wrapper({super.key, required this.firebaseInitialized});

  @override
  Widget build(BuildContext context) {
    if (!firebaseInitialized) {
      return const Authenticate();
    }

    final user = Provider.of<F_User?>(context);
    // Return home/authenticate based on user authentication status
    if (user == null) {
      return const Authenticate();
    } else {
      return Home();
    }
  }
}
