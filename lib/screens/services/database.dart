import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_app/models/brew.dart';
import 'package:flutter_firebase_app/models/user.dart';

class DatabaseService{

  final String uid;
  DatabaseService({required this.uid});
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

Future updateUserData(String sugars, String name, int strength) async {
  return await brewCollection.doc(uid).set({
    'sugars' : sugars,
    'name' : name,
    'strength' : strength,
  });
}

//brew list from a snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      var data = doc.data() as Map<String, dynamic>?; // Add null check and cast
      if (data == null) {
        return Brew(name: '', strength: 0, sugars: '0'); // Provide default values if data is null
      }
      return Brew(
        name: data['name'] ?? '',
        strength: data['strength'] ?? 0,
        sugars: data['sugars'] ?? '0',
      );
    }).toList();
  }

  //userdata from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?; // Cast to Map<String, dynamic>

    return UserData(
      uid: uid,
      name: data?['name'] ?? '', // Use null-aware operator and provide a default value
      sugars: data?['sugars'] ?? 0, // Default value for sugars
      strength: data?['strength'] ?? 0, // Default value for strength
    );
  }



// get brews stream
Stream<List<Brew>> get brews{
  return brewCollection.snapshots().map(_brewListFromSnapshot);
}

//get user doc stream
Stream<UserData> get userData{
  return brewCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
}

} 