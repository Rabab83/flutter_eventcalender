import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketingApp/model/accountbrief.dart';

class DataService {
  static final DataService _dataService = DataService._internal();
  FirebaseFirestore _db = FirebaseFirestore.instance;

  DataService._internal();

  factory DataService() {
    return _dataService;
  }

  Future<List<AccountBreif>> getAccountBreif() async {
    var snap = await _db.collection('accountBreifs').get();
    return snap.docs
        .map((doc) => new AccountBreif.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<void> addAccountBreif(AccountBreif accountBreif) {
    return _db.collection('accountBreifs').doc(accountBreif.email).set(accountBreif.toMap());
  }

  Future<void> deleteAccountBreif(String id) {
    return _db.collection('accountBreifs').doc(id).delete();
  }

  Future<void> updateAccountBreif(AccountBreif accountBreif) {
    return _db
        .collection('accountBreifs')
        .doc(accountBreif.id)
        .update(accountBreif.toMap());
  }
}
