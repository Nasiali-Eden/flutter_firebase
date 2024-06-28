import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/screens/services/auth.dart';

class Home extends StatelessWidget {
   Home({super.key});

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text('Brewer'),
        backgroundColor: Colors.brown[500],
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person),
            onPressed: () async{
              await _auth.signOut();
            },
            label: Text('logout'),
          )
        ],
      ),
    );
  }
}
