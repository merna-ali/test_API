import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/postModel.dart';
import '../network/api.dart';
import 'AddAuthar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> post = [];

  void getAppiCall() async {
    setState(() {
      API.addPost().then((value) => {
            setState(() {
              List list = json.decode(value.body);
              post = list.map((model) => Post.fromJson(model)).toList();
            })
          });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAppiCall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('networking 2'),
      ),
      body: ListView.builder(
          itemCount: post.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    child: Text(post[index].title ?? ''),
                  ),
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        API.deletePost(post[index].id ?? 0);
                      });
                    },
                    child: Icon(Icons.remove))
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddAuthar()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
