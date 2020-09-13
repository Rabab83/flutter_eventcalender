import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketingApp/model/accountbrief.dart';

class DatabasesService {
  static final DatabasesService _firestoreService =
      DatabasesService._internal();
  FirebaseFirestore _db = FirebaseFirestore.instance;

  DatabasesService._internal();

  factory DatabasesService() {
    return _firestoreService;
  }

  Future<List<AccountBreif>> getAccountBreif() async {
    var snap = await _db.collection('accountbreif').get();
    return snap.docs
        .map((doc) => new AccountBreif.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<void> addAccountBreif(AccountBreif accountbreif) {
    return _db.collection('accountbreif').add(accountbreif.toMap());
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
