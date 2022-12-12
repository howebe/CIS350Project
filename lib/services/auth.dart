import 'package:firebase_auth/firebase_auth.dart';
import 'package:textbook_sharing_app/models/user.dart';
import 'package:textbook_sharing_app/services/database.dart';

//Creating class for authentification
class AuthService {

//Creates instance of current firebase
final FirebaseAuth _auth = FirebaseAuth.instance;

//create user obj based on FirebaseUser
AppUser? _userFromFirebaseUser(User user){
  return AppUser(uid: user.uid);
}

//Sets the current logged in users info to a user type and UserID for later uses
String get inputData {
  final User? user = _auth.currentUser;
  final uid = user?.uid;
  return uid!;
}

//authentification change user stream
 Stream<AppUser?> get user { 
         return _auth.authStateChanges().map((User? user) => _userFromFirebaseUser(user!));
}

//sign in with email & password using information passed into sign in textfields. Only executes if input is not null
Future signInWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    User? user = result.user;
    return _userFromFirebaseUser(user!);
  }catch (e){
    return null;
  }
}


/*register with email & password using information passed into register textfields and adds new user
 to user collection in firebase. Only executes if input is not null*/
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


//sign out the current user if there is one
Future signOut() async {
  try{
    return await _auth.signOut();
  }catch(e){
    return null;
  }
}

}