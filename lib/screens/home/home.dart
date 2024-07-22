import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/screens/services/auth.dart';
import 'package:flutter_firebase_app/screens/services/database.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';

class Home extends StatelessWidget {
   Home({super.key});

  final AuthService _auth = AuthService();
  @override

  Widget build(BuildContext context) {
    final user = Provider.of<F_User?>(context);
    return StreamProvider<QuerySnapshot?>.value(
      value: DatabaseService(uid: user?.uid??'').brews,
      initialData: null,

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
      ),
    );
  }
}
