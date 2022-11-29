import 'package:flutter/material.dart';
import 'package:textbook_sharing_app/screens/welcome/generalListing.dart';
import 'package:textbook_sharing_app/screens/auth/auth.dart';
import 'package:textbook_sharing_app/screens/wrapper.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[600],
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
//buttons
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const GeneralListing(title: 'Textbook Catalog');
                  }));
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.white, // your color here
                          width: 5,
                        ),
                        borderRadius: BorderRadius.circular(0)))),
                child: Container(
                  height: 100,
                  width: 200,
                  child: const Text(
                    textAlign: TextAlign.center,
                    'Continue without signing in',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                height: 200,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Wrapper();
                  }));
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.white, // your color here
                          width: 5,
                        ),
                        borderRadius: BorderRadius.circular(0)))),
                child: Container(
                  height: 100,
                  width: 200,
                  child: const Text(
                    textAlign: TextAlign.center,
                    'Login or Register',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
