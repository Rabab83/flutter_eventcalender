import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketingApp/model/note.dart';

class FirestoreService {
  static final FirestoreService _firestoreService =
      FirestoreService._internal();
  FirebaseFirestore _db = FirebaseFirestore.instance;

  FirestoreService._internal();

  factory FirestoreService() {
    return _firestoreService;
  }

  Future<List<Note>> getNotes() async {
    var snap = await _db.collection('notes').get();
    return snap.docs
        .map((doc) => new Note.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<void> addNote(Note note) {
    return _db.collection('notes').add(note.toMap());
  }

  Future<void> deleteNote(String id) {
    return _db.collection('notes').doc(id).delete();
  }

  Future<void> updateNote(Note note) {
    return _db.collection('notes').doc(note.id).updateData(note.toMap());
  }
}
