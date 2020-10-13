import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketingApp/model/classes.dart';

          // firebase CRUD Functions
class NewBrandDB {
  static final NewBrandDB _newBrandDB = NewBrandDB._internal();
  FirebaseFirestore _db = FirebaseFirestore.instance;
  NewBrandDB._internal();

  factory NewBrandDB() {
    return _newBrandDB;
  }

  Future<List<NewBrand>> getBrandsNames() async {
    var snap = await _db.collection('users').get();
    return snap.docs
           .map((doc) => new NewBrand.fromMap(doc.data(), doc.id))
           .toList();
  }

  // Future<dynamic> getOneBrandName(NewBrand newBrand) async {
  //   DocumentSnapshot snap =
  //       await _db.collection('users').doc(newBrand.id).get();
  //   return snap.data();
  // }

  Future<void> addBrandName(NewBrand newBrand) {
    return _db.collection('users')
             .doc(newBrand.email)
             .set(newBrand.toMap());
  }
  
  Future<void> deleteBrandName(String id) {
    return _db.collection('users').doc(id).delete();
  }

  Future<void> updateBrandName(NewBrand newBrand) {
    return _db.collection('users').doc(newBrand.id).update(newBrand.toMap());
  }
}

//************************************************************************//
//************************************************************************//
              //Account Breif CRUD Functions

class NewAccountBreifDB {
   
  NewAccountBreifDB._internal();
  static final NewAccountBreifDB _newAccountBreifDB=NewAccountBreifDB._internal();
  FirebaseFirestore _db = FirebaseFirestore.instance;

  factory NewAccountBreifDB() {
    return _newAccountBreifDB;
  }

  Future<List<AccountBreif>> getAccountBreifs() async {
    var snap = await _db.collection('accountBreifs').get();
    return snap.docs
          .map((doc) => new AccountBreif.fromAccountBreif(doc.data(), doc.id))
          .toList();
  }

  Future<AccountBreif> getOneAccountBreif(String aBid) async {
    var accounts = getAccountBreifs();
    var account = await accounts
        .then((value) => value.firstWhere((element) => element.aBid == aBid));

    return account;
  }

  Future<void> addAccountBreif(AccountBreif accountBreif) {
    return _db
        .collection('accountBreifs')
        .doc(accountBreif.aBid)
        .set(accountBreif.toAccountBreif());
  }
 
  Future<void> deleteAccountBreif(String id) {
    return _db.collection('accountBreifs').doc(id).delete();
  }

  Future<void> updateAccountBreif(AccountBreif accountBreif) {
    return _db
        .collection('accountBreifs')
        .doc(accountBreif.aBid)
        .update(accountBreif.toAccountBreif());
  }

  Future<void> initializaAccountBreif(AccountBreif accountBreif) {
    return _db
        .collection('accountBreifs')
        .doc(accountBreif.aBid)
        .set(accountBreif.initialAccountBreif());
  }
}
