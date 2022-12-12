import 'package:flutter/material.dart';
import 'package:textbook_sharing_app/constants.dart';
import 'package:textbook_sharing_app/services/auth.dart';
import 'package:textbook_sharing_app/services/database.dart';

//Creating class for Posting book
class PostBookPage extends StatefulWidget {
  
  //Will store the users identification used at login
  final String? uid;
  const PostBookPage({super.key, this.uid});
  
  //Creates a flutter widget for the post book page
  @override  
  State<PostBookPage> createState() => _PostBookPageState();

  //Checks the values passed in from text boxes and returns true if all are filled with text
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

//initilization of flutter widget class for posting book 
class _PostBookPageState extends State<PostBookPage> {
  
  //changes any null inputs to text boxes as an empty string
  final List<TextEditingController> _controller = [
    for (int i = 0; i < 2; i++) TextEditingController()
  ];
  
  //All user interface development and binded functionalities
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
          //Book name input set to first index of _controller list
          TextFormField(
            controller: _controller[0],
            decoration:
                textInputDecoration.copyWith(hintText: "Book name..."),
          ),
          Container(
              height: 10,
              color: Colors.blue[600],
            ),
          //Book description input set to second index of _controller list
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
              //checks to make sure any empty strings were not passed into the list
              if (checkInputValues(_controller[0].text) && checkInputValues(_controller[1].text)) {
                //initializes instance of the database class
                final DatabaseService db = DatabaseService();
                //initializes instance of the auth class
                final auth = AuthService();
                //sets userID to current users ID info
                String userID = auth.inputData;
                //sets inputs to textfields and userID to a new instance of a textbook to be posted
                Map<String, String> textbook = {
                  'Name': _controller[0].text,
                  'Description': _controller[1].text,
                  'Owner': userID,
                };

                //Adds this instance of a textbook to firebase
                db.addTextbook(textbook);
                //changes post book page to default form after button press
                Navigator.pop(context);
              }
            },
            //Cosmetic adjustments to "Post a new book" button
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

  //Checks the values passed in from controller list and retruns true if none of the indexes are empty strings
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
