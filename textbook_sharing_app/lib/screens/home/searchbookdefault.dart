import 'package:flutter/material.dart';
import 'package:textbook_sharing_app/screens/home/postbookpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../main.dart';

class SearchDefault extends StatefulWidget {
  const SearchDefault({Key? key}) : super(key: key);

  @override
  State<SearchDefault> createState() => _SearchDefaultState();
}

class _SearchDefaultState extends State<SearchDefault> {

  final genList = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: genList.collection('textbook_catalog').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
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