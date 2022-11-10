import 'package:flutter/material.dart';
import 'package:textbook_sharing_app/screens/home/postbookpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../main.dart';

class GeneralListing extends StatefulWidget {
  const GeneralListing({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<GeneralListing> createState() => _GeneralListingState();
}

class _GeneralListingState extends State<GeneralListing> {

  final genList = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: genList.collection('textbook_catalog').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                return Card(
                  child: ListTile(
                    title: Text(doc["Name"]),
                  ),
                );
              }).toList(),
            );
        },
      ),
    );
  }
}     