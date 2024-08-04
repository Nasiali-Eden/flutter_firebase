
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/models/brew.dart';
import 'package:flutter_firebase_app/screens/home/settings_form.dart';
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

    void showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: const SettingsForm(),
          );
      });
    }

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
            ),
            TextButton.icon(
              icon: const Icon(Icons.settings),
              label: const Text("Settings"),
              onPressed: () => showSettingsPanel(),
            )
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/coffee_bg.png'),
              fit: BoxFit.cover,
            )
          ),
            child: const BrewList()
        ),
      ),
    );
  }
}
