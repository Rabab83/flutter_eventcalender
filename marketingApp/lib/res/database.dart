import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final CollectionReference actionBriefCollection =
      FirebaseFirestore.instance.collection('actionBrief');
}
