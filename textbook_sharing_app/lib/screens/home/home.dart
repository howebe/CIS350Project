import 'package:flutter/material.dart';
import 'package:textbook_sharing_app/constants.dart';
import 'package:textbook_sharing_app/screens/home/textlist.dart';
import 'package:textbook_sharing_app/screens/postbookpage.dart';
import 'package:textbook_sharing_app/screens/welcome/welcomepage.dart';
import 'package:textbook_sharing_app/services/auth.dart';
import 'package:textbook_sharing_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  final String? uid;
  Home({super.key, this.uid});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      initialData: null,
      value: DatabaseService().user,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('TextBook App'),
          backgroundColor: Colors.brown[400],
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
            ListTile(
              leading: Icon(Icons.create_outlined, color: Colors.black),
              title: Text('Post a Book'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return PostBookPage();
            }));
              },
            ),
            ListTile(
              leading: Icon(Icons.create_outlined, color: Colors.black),
              title: Text('Search Books'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return PostBookPage();
            }));
              },
            ),
            ListTile(
              leading: Icon(Icons.create_outlined, color: Colors.black),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return PostBookPage();
            }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
