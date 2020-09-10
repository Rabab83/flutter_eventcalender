import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketingApp/model/accountbrief.dart';

class DatabaseService {
  static final DatabaseService _firestoreService = DatabaseService._internal();
  FirebaseFirestore _db = FirebaseFirestore.instance;

  DatabaseService._internal();

  factory DatabaseService() {
    return _firestoreService;
  }

  Future<List<AccountBreif>> getActionBreif() async {
    var snap = await _db.collection('actionbreif').get();
    return snap.docs
        .map((doc) => new AccountBreif.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<void> addAccountBreif(AccountBreif accountbreif) {
    return _db.collection('actionbreif').add(accountbreif.toMap());
  }

  Future<void> deleteAccountBreif(String id) {
    return _db.collection('accountbreif').doc(id).delete();
  }

  Future<void> updateAccountBreif(AccountBreif accountbreif) {
    return _db
        .collection('accountbreif')
        .doc(accountbreif.id)
        .update(accountbreif.toMap());
  }
}
