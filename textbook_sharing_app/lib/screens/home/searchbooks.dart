import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:textbook_sharing_app/screens/home/searchbookdefault.dart';

class SearchBooks extends StatefulWidget {
  const SearchBooks({super.key});

  @override
  State<SearchBooks> createState() => _SearchBooksState();
}

class _SearchBooksState extends State<SearchBooks> {
  Future<QuerySnapshot>? postTextbookList;
  String userText = '';

  initSearchBooks(String textEntered) {
    postTextbookList = FirebaseFirestore.instance
        .collection("textbook_catalog")
        .where("Name", isEqualTo: textEntered)
        .get();

    setState(() {
      postTextbookList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.white]),
          ),
        ),
        title: TextField(
          onChanged: (textEntered) {
            setState(() {
              userText = textEntered;
            });

            initSearchBooks(textEntered);
          },
          decoration: InputDecoration(
            hintText: "Search for textbook...",
            hintStyle: const TextStyle(color: Colors.white),
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                initSearchBooks(userText);
              },
            ),
          ),
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: postTextbookList,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(snapshot.data!.docs[index]["Name"]),
                      ),
                    );
                  },
                )
              : const SearchDefault();
        },
      ),
    );
  }
}
