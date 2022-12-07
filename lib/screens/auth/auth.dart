import 'package:flutter/material.dart';
import 'package:textbook_sharing_app/screens/auth/register.dart';
import 'package:textbook_sharing_app/screens/auth/signin.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  get showSignIn => null;

  @override
  State<Auth> createState() => _AuthState();

  void toggleView() {}
}

class _AuthState extends State<Auth> {

bool showSignIn = true;
void toggleView() {
  setState(() => showSignIn = !showSignIn);
}

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}