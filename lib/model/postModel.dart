
class Post {
  String? title;
  int? id;
  String? body;
  int? userId;

  Post({this.title, this.id, this.body,this.userId});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    userId = json['userId'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['userId'] = userId;

    return data;
  }
}
