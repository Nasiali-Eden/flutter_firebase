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

  String? _currentName; // Make nullable
  String? _currentSugars; // Make nullable
  int _currentStrength = 100; // Initialize with a default value

  @override
  Widget build(BuildContext context) {
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
            controller: textController,
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
            value: _currentSugars ?? sugars[0], // Default to the first item
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                  value: sugar, child: Text('$sugar sugars'));
            }).toList(),
            onChanged: (val) => setState(() {
              _currentSugars = val!;
            }),
          ),

          // Slider for strength
          Slider(
            value: _currentStrength.toDouble(),
            activeColor: Colors.brown[_currentStrength], // Use integer division
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
                // Handle form submission logic here
                print('Name: $_currentName');
                print('Sugars: $_currentSugars');
                print('Strength: $_currentStrength');
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
  }
}
