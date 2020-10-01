
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketingApp/model/transaction.dart';

class DataProjectService {
  static final DataProjectService _dataService = DataProjectService._internal();
  FirebaseFirestore _db = FirebaseFirestore.instance;

  DataProjectService._internal();

  factory DataProjectService() {
    return _dataService;
  }

  Future<List<Transsaction>> getTransactions() async {
    var snap = await _db.collection('transactions').get();
    return snap.docs
        .map((doc) => new Transsaction.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<dynamic> getOneProject(String id) async {
    DocumentSnapshot snap = await _db.collection('transactions').doc(id).get();
    return snap.data();
  }

  Future<void> addTransaction(Transsaction transsaction) {
    return _db
        .collection('transactions')
        .doc(transsaction.projectEmail)
        .set(transsaction.toMap());
  }

  Future<void> deleteTransaction(String id) {
    return _db.collection('transactions').doc(id).delete();
  }

  Future<void> updateTransaction(Transsaction transsaction) {
    return _db
        .collection('transactions')
        .doc(transsaction.id)
        .update(transsaction.toMap());
  }
}
