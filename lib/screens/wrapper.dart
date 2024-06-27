import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:flutter_firebase_app/screens/home/home.dart';
import 'package:flutter_firebase_app/models/user.dart';

class wrapper extends StatelessWidget {
  const wrapper({super.key});

  // return home or authenticate
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<F_User?>(context);
    print(user);
    return const Authenticate();
  }
}
