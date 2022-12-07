import 'package:flutter/material.dart';
import 'package:textbook_sharing_app/screens/home/postbookpage.dart';
import 'package:textbook_sharing_app/screens/home/searchbooks.dart';
import 'package:textbook_sharing_app/services/auth.dart';
import 'package:textbook_sharing_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  Home({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      initialData: null,
      value: DatabaseService(uid: toString()).user,
      child: Scaffold(
        backgroundColor: Colors.blue[600],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('TextBook App'),
          backgroundColor: Colors.black,
          elevation: 0.0,
          actions: <Widget>[
            ElevatedButton.icon(
              icon: const Icon(Icons.person),
              label: const Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 10,
              color: Colors.white,
            ),
            ListTile(
              leading: const Icon(Icons.create_outlined, color: Colors.white),
              title: const Text(
                'Post a Book',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PostBookPage();
                }));
              },
            ),
            Container(
              height: 10,
              color: Colors.white,
            ),
            ListTile(
              leading: const Icon(Icons.search, color: Colors.white),
              title: const Text(
                'Search Books',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SearchBooks();
                }));
              },
            ),
            Container(
              height: 10,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
