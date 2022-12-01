import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:textbook_sharing_app/textbook.dart';

class DatabaseService {
//PROBLEM - Figure out how to get user ID once signed in
  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference users =
      FirebaseFirestore.instance.collection('Users');
  final CollectionReference textbooks =
      FirebaseFirestore.instance.collection('textbook_catalog');

//Update user textbook list
  Future updateUser(List<Textbook> textbooks) async {
    Map<String, List<Textbook>> textbook = {
      'textbook': textbooks,
    };

    return await users.doc(uid).set(textbook);
  }

  // Add Textbook to User List

  // Add Textbook to Catalog
  Future addTextbook(
      Map<String, String> textbook) async {
    return await textbooks.doc(uid).set(textbook);
  }

  // Grab Textbook

  // Grab User List

  // Grab User as a whole
  Stream<QuerySnapshot> get user {
    return users.snapshots();
  }

  // Grab textbook list Stream
  Stream<QuerySnapshot> get textbook {
    print(textbook);
    return textbooks.snapshots();
  }
}
