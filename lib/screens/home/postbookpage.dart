import 'package:flutter/material.dart';
import 'package:textbook_sharing_app/constants.dart';
import 'package:textbook_sharing_app/services/auth.dart';
import 'package:textbook_sharing_app/services/database.dart';

/*
The post book page class allows the user to enter in the name 
and description of the book they would like to post to the
firestore database.
*/
class PostBookPage extends StatefulWidget {
  final String? uid;
  const PostBookPage({super.key, this.uid});

  @override
  State<PostBookPage> createState() => _PostBookPageState();

  // Public access to method to check user input isn't empty
  bool checkInputValues(String a) {
    bool filled = true;

    for (var i = 0; i < 2; i++) {
      if (a.isEmpty) {
        filled = false;
      }
    }
    return filled;
  }
}

class _PostBookPageState extends State<PostBookPage> {
  // Create two text editing controller to track user input
  final List<TextEditingController> _controller = [
    for (int i = 0; i < 2; i++) TextEditingController()
  ];

  // Create scaffold containing UI design
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      appBar: AppBar(
        title: const Text('Post Book'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            height: 10,
            color: Colors.blue[600],
          ),

          // Book name input set to first index of _controller list
          TextFormField(
            controller: _controller[0],
            decoration: textInputDecoration.copyWith(hintText: "Book name..."),
          ),
          Container(
            height: 10,
            color: Colors.blue[600],
          ),
          // Book description input set to second index of _controller list
          TextFormField(
            controller: _controller[1],
            decoration:
                textInputDecoration.copyWith(hintText: "Description..."),
          ),
          Container(
            height: 15,
            color: Colors.blue[600],
          ),

          //Adds input to firebase when "Post a new book" button is pressed
          TextButton(
            onPressed: () {
              // Checks that user input isn't empty
              if (checkInputValues(_controller[0].text) &&
                  checkInputValues(_controller[1].text)) {
                // Create instance of database and authservice
                final DatabaseService db = DatabaseService();
                final auth = AuthService();

                //sets inputs to textfields and userID to a new instance of a textbook to be posted
                Map<String, String> textbook = {
                  'Name': _controller[0].text,
                  'Description': _controller[1].text,
                  'Owner': auth.inputData,
                };

                // Adds mapped textbook to firestore database as a new document
                db.addTextbook(textbook);

                // Navigate back to home page
                Navigator.pop(context);
              }
            },

            // Cosmetic for post book button
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.white, // your color here
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(0)))),
            child: const SizedBox(
              width: 200,
              child: Text(
                textAlign: TextAlign.center,
                'Post a new book',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Checks the values passed in from controller list and returns true if none of the indexes are empty strings
  bool checkInputValues(String text) {
    bool filled = true;

    for (var i = 0; i < 2; i++) {
      if (_controller[i].text.isEmpty) {
        filled = false;
      }
    }
    return filled;
  }
}
