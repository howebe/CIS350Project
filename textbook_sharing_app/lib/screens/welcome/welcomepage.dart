import 'package:flutter/material.dart';
import 'package:textbook_sharing_app/screens/generalListing.dart';

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
        child: TextButton(
          onPressed: () {
            
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const GeneralListing(title: 'Textbook Catalog');
            }));
          },
          child: const Text('Press to Get Started!'),
        ),
      ),
    );
  }
}