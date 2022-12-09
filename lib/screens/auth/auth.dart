import 'package:flutter/material.dart';
import 'package:textbook_sharing_app/screens/auth/register.dart';
import 'package:textbook_sharing_app/screens/auth/signin.dart';

// ignore: must_be_immutable
class Auth extends StatefulWidget {
  Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();

  bool showSignIn = true;
  void toggleView() {
    showSignIn = !showSignIn;
  }

  bool getShowSignIn() => showSignIn;
}

class _AuthState extends State<Auth> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  bool getShowSignIn() => showSignIn;

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
