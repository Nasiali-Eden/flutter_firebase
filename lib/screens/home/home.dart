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
        backgroundColor: Colors.grey[100],
        elevation: 0.0,
        actions: [
          TextButton.icon(
            icon: Icon(Icons.person, color: Colors.grey[500],),
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
