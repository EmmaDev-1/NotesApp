// lib/view_model/note_view_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app/model/note_model.dart';

class NoteViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<NoteModel> notes = [];
  List<NoteModel> archivedNotes = [];
  bool isLoading = false;

  Future<void> fetchNotes() async {
    final user = _auth.currentUser;
    if (user == null) return;

    isLoading = true;
    notifyListeners();

    QuerySnapshot snapshot = await _firestore
        .collection('notes')
        .where('userId', isEqualTo: user.uid)
        .where('status', whereIn: ['Pending', 'Done']).get();

    notes = snapshot.docs
        .map((doc) =>
            NoteModel.fromMap(doc.id, doc.data() as Map<String, dynamic>))
        .toList();

    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchArchivedNotes() async {
    final user = _auth.currentUser;
    if (user == null) return;

    isLoading = true;
    notifyListeners();

    QuerySnapshot snapshot = await _firestore
        .collection('notes')
        .where('userId', isEqualTo: user.uid)
        .where('status', whereIn: ['Archived']).get();

    archivedNotes = snapshot.docs
        .map((doc) =>
            NoteModel.fromMap(doc.id, doc.data() as Map<String, dynamic>))
        .toList();

    isLoading = false;
    notifyListeners();
  }

  Future<void> addNote(NoteModel note) async {
    await _firestore.collection('notes').add(note.toMap());
    fetchNotes();
  }

  Future<void> updateNote(NoteModel note) async {
    await _firestore.collection('notes').doc(note.id).update(note.toMap());
    fetchNotes();
    fetchArchivedNotes();
  }

  Future<void> updateNoteStatus(String id, String status) async {
    await _firestore.collection('notes').doc(id).update({'status': status});
    fetchNotes();
    fetchArchivedNotes();
  }

  Future<void> archiveNote(String id) async {
    await _firestore.collection('notes').doc(id).update({'status': 'Archived'});
    fetchNotes();
    fetchArchivedNotes();
  }

  Future<void> deleteNote(String id) async {
    await _firestore.collection('notes').doc(id).delete();
    notes.removeWhere((note) => note.id == id);
    archivedNotes.removeWhere((note) => note.id == id);
    notifyListeners();
  }
}
