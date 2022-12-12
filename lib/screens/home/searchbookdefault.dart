import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Creating class for default search page
class SearchDefault extends StatefulWidget {
  const SearchDefault({Key? key}) : super(key: key);

  //Creates a flutter widget for the default search page
  @override
  State<SearchDefault> createState() => _SearchDefaultState();
}

//initilization of flutter widget class for default search page
class _SearchDefaultState extends State<SearchDefault> {

  //Creates instance of current firebase 
  final genList = FirebaseFirestore.instance;

  //All user interface development and binded functionalities
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      //Main screen of default search page lists all textbooks in the textbook catalog
      body: StreamBuilder<QuerySnapshot>(
        //grabs textbook catalog from firebase as a stream
        stream: genList.collection('textbook_catalog').snapshots(),
        //checks to see if snapshot of collection has any inputs
        builder: (context, snapshot) {
          //Loading animation if snapshot finds no inputs in the collection
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          //Display all inputs in collection if data is present as a list
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