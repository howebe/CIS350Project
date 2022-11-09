import 'package:firebase_auth/firebase_auth.dart';
import 'package:textbook_sharing_app/models/user.dart';
import 'package:textbook_sharing_app/services/database.dart';
import 'package:textbook_sharing_app/textbook.dart';

class AuthService {

final FirebaseAuth _auth = FirebaseAuth.instance;

// create user obj based on FirebaseUser
AppUser? _userFromFirebaseUser(User user){
  return AppUser(uid: user.uid);
}

// auth change user stream
 Stream<AppUser?> get user { 
         return _auth.authStateChanges().map((User? user) => _userFromFirebaseUser(user!));
}

// sign in with email & password
Future signInWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    User? user = result.user;
    return _userFromFirebaseUser(user!);
  }catch (e){
    print(e.toString());
    return null;
  }
}


// register with email & password
Future registerWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    User? user = result.user;
    await DatabaseService(uid: user!.uid).updateUser([]);
    return _userFromFirebaseUser(user!);
  }catch (e){
    print(e.toString());
    return null;
  }
}


// sign out
Future signOut() async {
  try{
    return await _auth.signOut();
  }catch(e){
    print(e.toString());
    return null;
  }
}

}