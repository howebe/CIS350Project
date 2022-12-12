import 'package:firebase_auth/firebase_auth.dart';
import 'package:textbook_sharing_app/models/user.dart';
import 'package:textbook_sharing_app/services/database.dart';

/*
AuthService class is responsible for all the methods that 
deal with authentification to firebase auth. This includes
signing in and registering into the app as well as
helper functions for these.
*/

class AuthService {
// Creates instance of firebase authentification
  final FirebaseAuth _auth = FirebaseAuth.instance;

// Grabs a user of the app
  AppUser? _userFromFirebaseUser(User user) {
    return AppUser(uid: user.uid);
  }

// Gets the userID for the current user
  String get inputData {
    final User? user = _auth.currentUser;
    final uid = user?.uid;
    return uid!;
  }

// Gets firebase user from firestore
  Stream<AppUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user!));
  }

// Firebase method to sign in using user credentials
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      return null;
    }
  }

// Firebase method to register into firebase auth
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      await DatabaseService(uid: user!.uid).updateUser([]);
      return _userFromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }

// Firebase method to sign user out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
