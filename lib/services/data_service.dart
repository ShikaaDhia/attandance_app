// 

import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendance');

  Future<QuerySnapshot> getData() {
    // untk mendapatkan/membaca data dri database
    // get data dri API (suatu pengantar) 
    return dataCollection.get();
  } 

  Future<void> deleteData(String docId) {
    // untk mengahpus data dri database
    return dataCollection.doc(docId).delete();
  }
}