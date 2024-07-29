
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/models/brew.dart';
import 'package:flutter_firebase_app/screens/services/auth.dart';
import 'package:flutter_firebase_app/screens/services/database.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import 'brew_list.dart';

class Home extends StatelessWidget {
   Home({super.key});

  final AuthService _auth = AuthService();
  @override

  Widget build(BuildContext context) {
    final user = Provider.of<F_User?>(context);
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService(uid: user?.uid??'').brews,
      initialData: const [],

      child: Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          title: const Text('Brewer'),
          backgroundColor: Colors.grey[100],
          elevation: 0.0,
          actions: [
            TextButton.icon(
              icon: Icon(Icons.person, color: Colors.grey[500],),
              onPressed: () async{
                await _auth.signOut();
              },
              label: const Text('logout'),
            )
          ],
        ),
        body: const BrewList(),
      ),
    );
  }
}
