import 'package:advancedapi/model/postModel.dart';
import 'package:advancedapi/network/api.dart';
import 'package:flutter/material.dart';

class AddAuthar extends StatefulWidget {
  const AddAuthar({super.key});

  @override
  State<AddAuthar> createState() => _AddAutharState();
}

class _AddAutharState extends State<AddAuthar> {
  String? title;
  String? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('new post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    labelText: 'authar name', hintText: "enter authar name "),
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: 'authar name', hintText: "enter authar name "),
                onChanged: (value) {
                  setState(() {
                    body = value;
                  });
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    API.createAuthar(Post(title: title,body: body)).then((value) => {
                          AlertDialog(
                            content: Text('kjk'),
                          )
                        });
                  },
                  child: Text(' add this authar'))
            ],
          ),
        ),
      ),
    );
  }
}
