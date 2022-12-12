import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:textbook_sharing_app/textbook.dart';

//Creating class for database communication
class DatabaseService {
  //Will store the users identification used at login
  final String? uid;
  DatabaseService({this.uid});

  //Stores all instances of a user collection in a collectionReference data type
  final CollectionReference users =
      FirebaseFirestore.instance.collection('Users');
  //Stores all instances of a textbool_catalog collection in a collectionReference data type
  final CollectionReference textbooks =
      FirebaseFirestore.instance.collection('textbook_catalog');

  //Update user textbook list associated with their login information
  Future updateUser(List<Textbook> textbooks) async {
    Map<String, List<Textbook>> textbook = {
      'textbook': textbooks,
    };

    return await users.doc(uid).set(textbook);
  }

  //Add Textbook to textbook_catalog collection in firebase
  Future addTextbook(
      Map<String, String> textbook) async {
    return await textbooks.doc(uid).set(textbook);
  }

  //Grab User list Stream
  Stream<QuerySnapshot> get user {
    return users.snapshots();
  }

  //Grab textbook list Stream
  Stream<QuerySnapshot> get textbook {
    return textbooks.snapshots();
  }
}
