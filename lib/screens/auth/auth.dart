import 'package:flutter/material.dart';
import 'package:textbook_sharing_app/screens/auth/register.dart';
import 'package:textbook_sharing_app/screens/auth/signin.dart';

/*
The auth class located in screens directory is responsible
for outputting the display for loggin in or signing up.
*/

// ignore: must_be_immutable
class Auth extends StatefulWidget {
  Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();

  bool showSignIn = true;

  // Public method used for toggle testing
  void toggleView() {
    showSignIn = !showSignIn;
  }

  // Getter for variable to determine which screen is displayed
  bool getShowSignIn() => showSignIn;
}

class _AuthState extends State<Auth> {
  bool showSignIn = true;

  // Method that switches the screen for signin/signup
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    // Will either display sign in page or sign up page
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
