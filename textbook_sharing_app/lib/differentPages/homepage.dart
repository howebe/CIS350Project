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
            leading: Icon(Icons.delete_forever, color: Colors.red),
            title: Text('Post a Book'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const PostBookPage();
            }));
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text('Favourites'),
            subtitle: Text('All your favourite widgets'),
            trailing: Icon(Icons.star, color: Colors.orange),
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text('High Ranked'),
            subtitle: Text('All widgets liked by the community'),
            trailing: Icon(Icons.mood, color: Colors.blue),
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text('Important'),
            subtitle: Text('All widgets that are important to know'),
            trailing: Icon(Icons.assistant_photo, color: Colors.black),
          ),
          ListTile(
            leading: Icon(Icons.delete_forever, color: Colors.red),
            title: Text('Deleted'),
            onTap: () {
              print('Deleted pressed');
            },
          ),
        ],
      ),
    );
  }
}