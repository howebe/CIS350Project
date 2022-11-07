import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:textbook_sharing_app/models/user.dart';
import 'package:textbook_sharing_app/screens/auth/auth.dart';
import 'package:textbook_sharing_app/screens/home/home.dart';
import 'package:textbook_sharing_app/services/auth.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);

    //returns authentication widget or home page
    if (user == null) {
      //ERROR Between this, auth services
      return Auth();
    } else {
      return Home();
    }
  }
}
