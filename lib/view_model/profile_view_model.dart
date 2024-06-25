// lib/view_model/profile_view_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;
  Map<String, dynamic>? userData;

  Future<void> fetchUserProfile() async {
    final user = _auth.currentUser;
    if (user == null) return;

    isLoading = true;
    notifyListeners();

    DocumentSnapshot snapshot =
        await _firestore.collection('users').doc(user.uid).get();

    userData = snapshot.data() as Map<String, dynamic>?;
    isLoading = false;
    notifyListeners();
  }

  Future<void> updateUserProfile(String firstName, String lastName) async {
    final user = _auth.currentUser;
    if (user == null) return;

    isLoading = true;
    notifyListeners();

    await _firestore.collection('users').doc(user.uid).update({
      'firstName': firstName,
      'lastName': lastName,
    });

    await fetchUserProfile();
  }

  Future<void> deleteUserProfile() async {
    final user = _auth.currentUser;
    if (user == null) return;

    isLoading = true;
    notifyListeners();

    // Elimina el documento del usuario en Firestore
    await _firestore.collection('users').doc(user.uid).delete();

    // Elimina el usuario de Firebase Auth
    await user.delete();

    isLoading = false;
    notifyListeners();
  }
}
