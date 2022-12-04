import 'package:flutter/material.dart';
import 'package:textbook_sharing_app/constants.dart';
import 'package:textbook_sharing_app/services/auth.dart';
import 'package:textbook_sharing_app/services/database.dart';

class PostBookPage extends StatefulWidget {
  final String? uid;
  const PostBookPage({super.key, this.uid});
  @override
  State<PostBookPage> createState() => _PostBookPageState();
}

class _PostBookPageState extends State<PostBookPage> {
  final List<TextEditingController> _controller = [
    for (int i = 0; i < 2; i++) TextEditingController()
  ];
  
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
          TextFormField(
            controller: _controller[0],
            decoration:
                textInputDecoration.copyWith(hintText: "Book name..."),
          ),
          Container(
              height: 10,
              color: Colors.blue[600],
            ),
          TextFormField(
            controller: _controller[1],
            decoration:
                textInputDecoration.copyWith(hintText: "Description..."),
          ),
          Container(
              height: 15,
              color: Colors.blue[600],
            ),
          TextButton(
            onPressed: () {
              if (checkInputValues()) {
                final DatabaseService db = DatabaseService();
                final auth = AuthService();
                String userID = auth.inputData;
                Map<String, String> textbook = {
                  'Name': _controller[0].text,
                  'Description': _controller[1].text,
                  'Owner': userID,
                };
                db.addTextbook(textbook);
                Navigator.pop(context);
              }
            },
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

  bool checkInputValues() {
    bool filled = true;

    for (var i = 0; i < 2; i++) {
      if (_controller[i].text.isEmpty) {
        filled = false;
      }
    }
    return filled;
  }
}
