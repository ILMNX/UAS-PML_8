import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static final _firestore = FirebaseFirestore.instance;

  static Future<void> addReport(String facility, String description) async {
    await _firestore.collection('reports').add({
      'facility': facility,
      'description': description,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  static Stream<QuerySnapshot> getReports() {
    return _firestore.collection('reports').orderBy('timestamp').snapshots();
  }
}
