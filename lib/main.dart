import 'package:flutter/material.dart';
import 'package:textbook_sharing_app/models/user.dart';
import 'package:textbook_sharing_app/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:textbook_sharing_app/screens/welcome/welcomepage.dart';
import 'package:provider/provider.dart';

/*
Root of the app. Contains the firebase initializations to connect
firebase firestore as well as creating and running the app itself.
*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Creates app and displays welcome page on start
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
      initialData: null,
      value: AuthService().user,
      catchError: (_, err) {
        return null;
      },

      // Welcome page on start
      child: const MaterialApp(
        home: WelcomePage(title: 'Welcome to Textbook Sharing'),
      ),
    );
  }
}
