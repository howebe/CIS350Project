import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../textbook.dart';

// Fix commmit issue for Ben

class PostBookPage extends StatefulWidget {
  const PostBookPage({super.key});

  @override
  State<PostBookPage> createState() => _PostBookPageState();
}

class _PostBookPageState extends State<PostBookPage> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Book'),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Upload Image Here',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Container(
            child: TextFormField(
              // controller: TextEditingController(text: Textbook.name),
              // onChanged: (value) {
              //         Textbook.name = value;
              //       },
              decoration: const InputDecoration(
                hintText: "Enter Book Name",
                border: UnderlineInputBorder(),
                labelText: 'Textbook name',
              ),
            ),
          ),
          Container(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Enter Description",
                border: UnderlineInputBorder(),
                labelText: 'Description',
              ),
            ),
          ),
          Container(
            child: TextFormField(
              controller: myController,
              decoration: const InputDecoration(
                hintText: "Enter Class",
                border: UnderlineInputBorder(),
                labelText: 'Class name',
              ),
            ),
          ),
          Container(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Enter University",
                border: UnderlineInputBorder(),
                labelText: 'University name',
              ),
            ),
          ),
          Container(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);

                // Future save() async {
                //   var res = await http.post('http://localhost:8080/catalog',
                //       headers: <String, String>{
                //         'Context-Type': 'application/json;charSet=UTF-8'
                //       },
                //       body: <String, String>{
                //         'name': Textbook.name,
                //         'password': user.password
                //       });
                //   print(res.body);
                
                // }

              },
              child: const Text('Press to Post Your Book!'),
            ),
          ),
        ],
      ),
    );
  }
}
