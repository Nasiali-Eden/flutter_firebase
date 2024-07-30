import 'package:flutter/material.dart';
import 'brew_tile.dart';
import 'package:flutter_firebase_app/models/brew.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({super.key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {


  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);
    
    return ListView.builder(
        itemCount: brews.length,
        itemBuilder: (context, index){
          return BrewTile(brew: brews[index]);
        },);
  }
}
