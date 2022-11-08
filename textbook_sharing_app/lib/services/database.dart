import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:textbook_sharing_app/textbook.dart';

class DatabaseService {

final String? uid;
DatabaseService({this.uid});

final CollectionReference users = FirebaseFirestore.instance.collection('Users');

// Future updateUser(List<Textbook> textbooks) async {
//   return await users.doc(uid).set({
//     'textbook' : textbooks,
//   }
//   );
// }
 Future updateUser(List<Textbook> textbooks) async {
    Map<String, List<Textbook>> textbook = {
      'textbook' : textbooks,
    };

    return await users.doc(uid).set(textbook);
  }

  // Text list from snapshot
  

  Stream<QuerySnapshot> get user{
    return users.snapshots();
  }
}