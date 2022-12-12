import 'package:flutter/material.dart';
import 'package:textbook_sharing_app/screens/welcome/general_listing.dart';
import 'package:textbook_sharing_app/screens/wrapper.dart';

/*
Welcome page class is displayed on opening of the app. It allows the user
to navigate to look through the books registered in the database, or 
navigate to log in for increased functionality.
*/

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key, required this.title}) : super(key: key);

  // Title of welcome page widget
  final String title;
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  
  // Create UI design for welcome page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[600],

        // App bar contains title
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(widget.title),
        ),

        // Body contains two textbuttons for the user to navigate
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                // Navigate to the general listing page to see all books
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const GeneralListing(title: 'Textbook Catalog');
                  }));
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.white,
                          width: 5,
                        ),
                        borderRadius: BorderRadius.circular(0)))),
                child: const SizedBox(
                  width: 200,
                  child: Text(
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
                // Navigate to authentification pages
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Wrapper();
                  }));
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.white,
                          width: 5,
                        ),
                        borderRadius: BorderRadius.circular(0)))),
                child: const SizedBox(
                  width: 200,
                  child: Text(
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
