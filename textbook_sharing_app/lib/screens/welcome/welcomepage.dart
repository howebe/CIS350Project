import 'package:flutter/material.dart';
import 'package:textbook_sharing_app/screens/generalListing.dart';
import 'package:textbook_sharing_app/screens/auth/auth.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const GeneralListing(title: 'Textbook Catalog');
              }));
            },
            child: const Text('Continue without signing in'),
            ),
            TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Auth();
              }));
            },
            child: const Text('Login or Register'),
            ),
          ],
      ),
    ));
  }
}