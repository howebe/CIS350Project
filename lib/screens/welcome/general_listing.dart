import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/*
This class is responsible for displaying all of the 
textbooks in the firestore database before a user
has loggin in.
*/

class GeneralListing extends StatefulWidget {
  const GeneralListing({Key? key, required this.title}) : super(key: key);

  // Title of widget
  final String title;

  @override
  State<GeneralListing> createState() => _GeneralListingState();
}

class _GeneralListingState extends State<GeneralListing> {

  // Creates instance to access database
  final genList = FirebaseFirestore.instance;

  // Create UI to display all textbooks
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
      ),

      // Grab all textbooks in stream builder
      body: StreamBuilder<QuerySnapshot>(
        stream: genList.collection('textbook_catalog').snapshots(),
        builder: (context, snapshot) {
          // Check that there is data in snapshot
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );

            // If data exists create display for list of books
          } else {
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                return Card(
                  child: ListTile(title: Text(doc["Name"]), onTap: () {}),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
