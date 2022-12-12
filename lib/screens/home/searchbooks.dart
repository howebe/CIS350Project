import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:textbook_sharing_app/screens/home/searchbookdefault.dart';

//Creating class for search page
class SearchBooks extends StatefulWidget {
  const SearchBooks({super.key});

  //Creates a flutter widget for the search page
  @override
  State<SearchBooks> createState() => _SearchBooksState();
}

//initilization of flutter widget class for search page
class _SearchBooksState extends State<SearchBooks> {
  //ititializes a query to grab the textbook list
  Future<QuerySnapshot>? postTextbookList;
  //input to the textfield
  String userText = '';

  /*called everytime a change is made to the textbox, querying the textbook catalog in 
  accordance with matching letters to the textbook names from the textbox*/
  initSearchBooks(String textEntered) {
    postTextbookList = FirebaseFirestore.instance
        .collection("textbook_catalog")
        .where("Name", isGreaterThanOrEqualTo: textEntered)
        .where("Name", isLessThanOrEqualTo: '$textEntered~')
        .get();

    setState(() {
      postTextbookList;
    });
  }

  //All user interface development and binded functionalities
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
        //listing presented will change in accordance to changes in the textfield
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
              //listing in relation to textfield input is presented when "Search for textbook" button is pressed 
              onPressed: () {
                initSearchBooks(userText);
              },
            ),
          ),
        ),
      ),
      //executes the acutal process of displaying searched books onto the main area of the search page
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
