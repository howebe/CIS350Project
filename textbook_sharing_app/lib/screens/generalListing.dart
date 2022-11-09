import 'package:flutter/material.dart';
import 'package:textbook_sharing_app/screens/postbookpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../main.dart';

class GeneralListing extends StatefulWidget {
  const GeneralListing({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<GeneralListing> createState() => _GeneralListingState();
}

class _GeneralListingState extends State<GeneralListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ListTile(
            leading: Icon(Icons.create_outlined, color: Colors.black),
            title: Text('Post a Book'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
              return PostBookPage();
            }));
            },
          ),
          // while(iterate through all books in the collection){
              // ListTile(
              //   leading: Icon(Icons.arrow_forward_ios),
              //   title: Text(FirebaseFirestore.instance.collection(/**/).snapshots()),
              //   subtitle: Text(FirebaseFirestore.instance.collection(/**/).snapshots()),
              //   onTap: () {
              //     print('Open Textbook Details');
              //   },
              // ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text('Textbook'),
            subtitle: Text('Details'),
            onTap: () {
              print('Open Textbook Details');
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text('Textbook'),
            subtitle: Text('Details'),
            onTap: () {
              print('Open Textbook Details');
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text('Textbook'),
            subtitle: Text('Details'),
            onTap: () {
              print('Open Textbook Details');
            },
          ),
        ],
      ),
    );
}
}

//THIS IS A METHOD FOR LISTING BOOKS FROM DB
// Stream<List<textbooks>> readTextbooks() => FirebaseFirestore.instance.collection('textbook_catalog').snapshots()
// .map((snapshot) => snapshot.docs.map((doc) => ).tolist());