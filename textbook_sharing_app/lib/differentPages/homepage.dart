import 'package:flutter/material.dart';
import 'package:textbook_sharing_app/differentPages/postbookpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ListTile(
            leading: Icon(Icons.create_outlined, color: Colors.black),
            title: Text('Post a Book'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const PostBookPage();
            }));
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text('Textbook'),
            subtitle: Text('Details'),
            onTap: () {
              print('Open Textbook Details');
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text('Textbook'),
            subtitle: Text('Details'),
            onTap: () {
              print('Open Textbook Details');
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text('Textbook'),
            subtitle: Text('Details'),
            onTap: () {
              print('Open Textbook Details');
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text('Textbook'),
            subtitle: Text('Details'),
            onTap: () {
              print('Open Textbook Details');
            },
          ),
        ],
      ),
    );
  }
}