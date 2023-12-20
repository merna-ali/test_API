import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/postModel.dart';

class API {
  static Future<Post> createAuthar(Post post) async {
    final http.Response response = await http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(post.toJson()));
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      print(response.body);
      return Post.fromJson(jsonDecode(response.body));
    } else {
      return throw Exception('error');
    }
  }

  static Future addPost() {
    return http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

  }

  static Future<http.Response> deletePost(int id) async {
    final http.Response response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
      headers: <String, String>{'Content-Type': 'application/json'},
    );
    if(response.statusCode == 200){
      print(response.body);
      return response;
    }else{
      print(response.body);
      throw Exception('error');
    }
  }
}
