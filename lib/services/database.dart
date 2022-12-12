import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:textbook_sharing_app/textbook.dart';

/*
Database service class is responsible for connecting to
and grabbing information from the firestore database
*/

class DatabaseService {
  // Instance that stores user ID
  final String? uid;
  DatabaseService({this.uid});

  // Grabs all users to store in collection reference
  final CollectionReference users =
      FirebaseFirestore.instance.collection('Users');

  // Grabs all textbooks to store in collection reference
  final CollectionReference textbooks =
      FirebaseFirestore.instance.collection('textbook_catalog');

  // Update user textbook list associated with their login information
  Future updateUser(List<Textbook> textbooks) async {
    Map<String, List<Textbook>> textbook = {
      'textbook': textbooks,
    };
    return await users.doc(uid).set(textbook);
  }

  // Add Textbook to textbook_catalog collection in firebase
  Future addTextbook(Map<String, String> textbook) async {
    return await textbooks.doc(uid).set(textbook);
  }

  // Grab user from database
  Stream<QuerySnapshot> get user {
    return users.snapshots();
  }

  //Grab textbook from databse
  Stream<QuerySnapshot> get textbook {
    return textbooks.snapshots();
  }
}
