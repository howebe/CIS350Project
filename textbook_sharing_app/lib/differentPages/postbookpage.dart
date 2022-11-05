import 'package:flutter/material.dart';
import '../textbook.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../main.dart';

class PostBookPage extends StatefulWidget {
  const PostBookPage({super.key});

  @override
  State<PostBookPage> createState() => _PostBookPageState();
}

class _PostBookPageState extends State<PostBookPage> {
  List<TextEditingController> _controller = [
    for (int i = 0; i < 6; i++) TextEditingController()
  ];

  List<String> conditions = [
    'Slightly Used',
    'Good',
    'New',
    'Very Good',
    'Fair',
    'Poor'
  ];

  List<String> keys = ['MTH', 'CHM', 'PHY', 'CIS', 'EGR', 'WRT'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Book'),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Upload Image Here',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Container(
            child: TextFormField(
              controller: _controller[0],
              decoration: const InputDecoration(
                hintText: "Enter Book Name",
                border: UnderlineInputBorder(),
                labelText: 'Textbook name',
              ),
            ),
          ),
          Container(
            child: TextFormField(
              controller: _controller[1],
              decoration: const InputDecoration(
                hintText: "Enter Description",
                border: UnderlineInputBorder(),
                labelText: 'Description',
              ),
            ),
          ),
          Container(
            child: TextFormField(
              controller: _controller[2],
              decoration: const InputDecoration(
                hintText: "Enter Class",
                border: UnderlineInputBorder(),
                labelText: 'Class name',
              ),
            ),
          ),
          Container(
            child: TextFormField(
              controller: _controller[3],
              decoration: const InputDecoration(
                hintText: "Enter University",
                border: UnderlineInputBorder(),
                labelText: 'University name',
              ),
            ),
          ),
          Container(
            child: TextFormField(
              controller: _controller[4],
              decoration: const InputDecoration(
                hintText: "Enter Condition",
                border: UnderlineInputBorder(),
                labelText: 'Condition',
              ),
            ),
          ),
          Container(
            child: TextFormField(
              controller: _controller[5],
              decoration: const InputDecoration(
                hintText: "Enter Matching Key",
                border: UnderlineInputBorder(),
                labelText: 'Key',
              ),
            ),
          ),
          Container(
            child: TextButton(
              onPressed: () {
                if (checkInputValues()) {
                  FirebaseFirestore.instance
                      .collection('textbook_catalog')
                      .add({
                    'Name': _controller[0].text,
                    'Description': _controller[1].text,
                    'Class': _controller[2].text,
                    'University': _controller[3].text,
                    'Condition': _controller[4].text,
                    'Key': _controller[5].text
                  });
                  Navigator.pop(context);
                } else {}
              },
              child: const Text('Press to Post Your Book!'),
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

    for (var i = 0; i < 6; i++) {
      if (_controller[i].text.isEmpty) {
        filled = false;
      }
    }

    bool detFalse = false;
    for (var i = 0; i < 4; i++) {
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

    for (var i = 0; i < conditions.length; i++) {
      if (conditions[i].toLowerCase() == _controller[4].text.toLowerCase()) {
        cfilled = true;
        _controller[4].text = conditions[i];
        break;
      } else {
        cfilled = false;
      }
    }

    if (!cfilled) {
      _controller[4].clear();
    }

    for (var i = 0; i < keys.length; i++) {
      if (keys[i].toLowerCase() == _controller[5].text.toLowerCase()) {
        kfilled = true;
        _controller[5].text = keys[i];
        break;
      } else {
        kfilled = false;
      }
    }

    if (!kfilled) {
      _controller[5].clear();
    }

    if (filled && cfilled && kfilled) {
      return true;
    }
    return false;
  }
}
