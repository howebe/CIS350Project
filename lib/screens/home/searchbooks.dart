import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:textbook_sharing_app/screens/home/searchbookdefault.dart';

/*
This class is responsible for displaying either the textbook names that
match the user's search or the general listing of textbooks before
the user has entered anything in the search bar yet.
*/

class SearchBooks extends StatefulWidget {
  const SearchBooks({super.key});

  @override
  State<SearchBooks> createState() => _SearchBooksState();
}

class _SearchBooksState extends State<SearchBooks> {
  
  // Inititializes a query to grab the textbook list
  Future<QuerySnapshot>? postTextbookList;

  // Instance that will store user text
  String userText = '';

  // This method grabs proper name data and will update what is displayed automatically
  initSearchBooks(String textEntered) {
    postTextbookList = FirebaseFirestore.instance
        .collection("textbook_catalog")
        .where("Name", isGreaterThanOrEqualTo: textEntered)
        .where("Name", isLessThanOrEqualTo: '$textEntered~')
        .get();

    // Updates state of list to be displayed
    setState(() {
      postTextbookList;
    });
  }

  //All UI development and binded functionalities
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

        // User input for search that changes state of listing
        title: TextField(
          onChanged: (textEntered) {
            setState(() {
              userText = textEntered;
            });

            initSearchBooks(textEntered);
          },

          // Cosmetics for app bar
          decoration: const InputDecoration(
            hintText: "Search for textbook...",
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
            suffixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ),
      ),

      // Grabs proper textbook names from database real time
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
