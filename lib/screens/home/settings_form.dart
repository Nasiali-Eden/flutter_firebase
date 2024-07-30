import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/components/textfield.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  final textController = TextEditingController();
  final passwordController = TextEditingController();

  late String _currentName;
  late String _currentSugars;
  late int _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Update your Brew Settings',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          MyTextField(
            validator: (val) => val!.isEmpty ? "Please Enter a Name" : null,
            onChanged: (val) => setState(() {
              _currentName = val;
            }),
            controller: textController,
            hintText: 'Enter your Name',
            obscureText: false,
          ),
          SizedBox(height: 20.0),
          DropdownButtonFormField(
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
            ),
            value: _currentSugars ?? '0',
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                  value: sugar, child: Text('$sugar sugars'));
            }).toList(),
            onChanged: (val) => setState(() {
              _currentSugars = val!;
            }),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[400],
              ),
              onPressed: () async {},
              child: Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
