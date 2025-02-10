// 

import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendance');

  Future<QuerySnapshot> getData() {
    return dataCollection.get();
  } // get data dri API (suatu pengantar) 

  Future<void> deleteData(String docId) {
    return dataCollection.doc(docId).delete();
  }
}