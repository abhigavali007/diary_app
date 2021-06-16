import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseManager {
  final CollectionReference datalist =
      FirebaseFirestore.instance.collection('data');

  Future<void> uplaodData(String date, String info) async {
    print(date + info);
    await Firebase.initializeApp();
    return await datalist.doc().set({'Date': date, 'Content': info});
  }
}
