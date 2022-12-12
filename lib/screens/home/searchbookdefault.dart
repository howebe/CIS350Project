import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/*
This class is responsible for displaying all of the textbooks
in the search page before the user enters in the name of
the textbook they are searching for.
*/

class SearchDefault extends StatefulWidget {
  const SearchDefault({Key? key}) : super(key: key);

  @override
  State<SearchDefault> createState() => _SearchDefaultState();
}

class _SearchDefaultState extends State<SearchDefault> {
  
  // Creates instance to access database
  final genList = FirebaseFirestore.instance;

  // All UI development and binded functionalities
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: StreamBuilder<QuerySnapshot>(
        // Grabs firebase snapshots from database under textbook_catalog
        stream: genList.collection('textbook_catalog').snapshots(),
        builder: (context, snapshot) {
          // If nothing in snapshot return circle progess indicator
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );

            // Creates list tiles of textbooks name fields from database
          } else {
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                return Card(
                  child: ListTile(
                    title: Text(doc["Name"]),
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
