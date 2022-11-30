import 'package:firebase_auth/firebase_auth.dart';
import 'package:textbook_sharing_app/models/user.dart';
import 'package:textbook_sharing_app/services/database.dart';

class AuthService {

final FirebaseAuth _auth = FirebaseAuth.instance;

// create user obj based on FirebaseUser
AppUser? _userFromFirebaseUser(User user){
  return AppUser(uid: user.uid);
}


String get inputData {
  final User? user = _auth.currentUser;
  final uid = user?.uid;
  return uid!;
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
    return null;
  }
}


// register with email & password
Future registerWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    User? user = result.user;
    await DatabaseService(uid: user!.uid).updateUser([]);
    return _userFromFirebaseUser(user);
  }catch (e){
    return null;
  }
}


// sign out
Future signOut() async {
  try{
    return await _auth.signOut();
  }catch(e){
    return null;
  }
}

}