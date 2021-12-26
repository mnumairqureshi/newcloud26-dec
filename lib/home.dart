import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
// import 'package:todo/helper/helper.dart';
import 'package:newcloud/helper/helper.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  var results;

  get storage => null;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () async {
                results = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['jpeg', 'jpg', 'png'],
                );

                setState(() {
                  results = results;
                  // results = results;
                });

                if (results == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('no file selected')));
                  return null;
                }
                final pathname = results.files.single.path;
                final filename = results.files.single.name;
                storage.uploadFile(pathname, filename);
              },
              child: Text("upload")),
          if (results != null)
            Container(
              child: Image.file(File(results.files.single.path)),
            )
        ],
      ),
    );
  }
}
