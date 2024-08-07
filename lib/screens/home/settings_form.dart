import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/Loading/load.dart';
import 'package:flutter_firebase_app/components/textfield.dart';
import 'package:flutter_firebase_app/models/user.dart';
import 'package:flutter_firebase_app/screens/services/database.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  final textController = TextEditingController();

  String? _currentName;
  String? _currentSugars;
  int _currentStrength = 100;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<F_User?>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user?.uid ?? '').userData,
      builder: (BuildContext context, AsyncSnapshot<UserData> snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data!;

          // Set initial values from userData
          _currentName = userData.name;
          _currentSugars = userData.sugars;
          _currentStrength = userData.strength;

          // Ensure _currentStrength is within the valid range
          if (_currentStrength < 100) _currentStrength = 100;
          if (_currentStrength > 900) _currentStrength = 900;

          return Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  'Update your Brew Settings',
                  style: TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 20.0),
                MyTextField(
                  validator: (val) => val!.isEmpty ? "Please Enter a Name" : null,
                  onChanged: (val) => setState(() {
                    _currentName = val;
                  }),
                  controller: textController..text = _currentName ?? '',
                  hintText: 'Enter your Name',
                  obscureText: false,
                ),
                const SizedBox(height: 20.0),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                  ),
                  value: _currentSugars,
                  items: sugars.map((sugar) {
                    return DropdownMenuItem(
                      value: sugar,
                      child: Text('$sugar sugars'),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() {
                    _currentSugars = val;
                  }),
                ),
                Slider(
                  value: _currentStrength.toDouble(),
                  activeColor: Colors.brown[_currentStrength],
                  inactiveColor: Colors.brown[_currentStrength],
                  min: 100,
                  max: 900,
                  divisions: 8,
                  onChanged: (val) => setState(() {
                    _currentStrength = val.round();
                  }),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[400],
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await DatabaseService(uid: user?.uid ?? '').updateUserData(
                        _currentSugars ?? userData.sugars,
                        _currentName ?? userData.name,
                        _currentStrength,
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Load();
        }
      },
    );
  }
}
