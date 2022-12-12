import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:textbook_sharing_app/models/user.dart';
import 'package:textbook_sharing_app/screens/auth/auth.dart';
import 'package:textbook_sharing_app/screens/home/home.dart';

/*
Wrapper class separates app into two different areas. The first
area is the authentification screens, but once log in was
successfull, the wrapper will direct you to the home page.
*/

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // Current user of the app
    final user = Provider.of<AppUser?>(context);

    // If a user exists, allow home page to be reached
    if (user == null) {
      return Auth();
    } else {
      return Home();
    }
  }
}
