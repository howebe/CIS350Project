import 'package:flutter/material.dart';
import 'package:textbook_sharing_app/constants.dart';
import 'package:textbook_sharing_app/screens/home/postbookpage.dart';
import 'package:textbook_sharing_app/screens/home/profilepage.dart';
import 'package:textbook_sharing_app/screens/home/searchbooks.dart';
import 'package:textbook_sharing_app/screens/welcome/welcomepage.dart';
import 'package:textbook_sharing_app/services/auth.dart';
import 'package:textbook_sharing_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
//final String? uid;
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
          title: Text('TextBook App'),
          backgroundColor: Colors.black,
          elevation: 0.0,
          actions: <Widget>[
            ElevatedButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
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
              leading: Icon(Icons.person, color: Colors.white),
              title: Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProfilePage();
                }));
              },
            ),
            Container(
              height: 10,
              color: Colors.white,
            ),
            ListTile(
              leading: Icon(Icons.create_outlined, color: Colors.white),
              title: Text(
                'Post a Book',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PostBookPage();
                }));
              },
            ),
            Container(
              height: 10,
              color: Colors.white,
            ),
            ListTile(
              leading: Icon(Icons.search, color: Colors.white),
              title: Text(
                'Search Books',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchBooks();
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
