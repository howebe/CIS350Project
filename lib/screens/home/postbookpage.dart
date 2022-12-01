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
    for (int i = 0; i < 3; i++) TextEditingController()
  ];
  
  List<String> keys = ['MTH', 'CHM', 'PHY', 'CIS', 'EGR', 'WRT'];
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
          TextFormField(
            controller: _controller[0],
            decoration:
                textInputDecoration.copyWith(hintText: "Book name..."),
          ),
          TextFormField(
            controller: _controller[1],
            decoration:
                textInputDecoration.copyWith(hintText: "Description..."),
          ),
          TextFormField(
            controller: _controller[2],
            decoration: textInputDecoration.copyWith(
              hintText: "Search Key...",
            ),
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
                  'Key': _controller[2].text,
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
    bool cfilled = true;
    bool kfilled = true;
    for (var i = 0; i < 3; i++) {
      if (_controller[i].text.isEmpty) {
        filled = false;
      }
    }
    bool detFalse = false;
    for (var i = 0; i < 2; i++) {
      if ((RegExp(r'^[a-z A-Z]+$').hasMatch(_controller[i].text)) &&
          (detFalse == false)) {
        filled = true;
      } else if (RegExp(r'^[a-z A-Z]+$').hasMatch(_controller[i].text)) {
        detFalse = false;
      } else {
        filled = false;
        detFalse = true;
        _controller[i].clear();
      }
    }
    for (var i = 0; i < keys.length; i++) {
      if (keys[i].toLowerCase() == _controller[2].text.toLowerCase()) {
        kfilled = true;
        _controller[2].text = keys[i];
        break;
      } else {
        kfilled = false;
      }
    }
    if (!kfilled) {
      _controller[2].clear();
    }
    if (filled && cfilled && kfilled) {
      return true;
    }
    return false;
  }
}
