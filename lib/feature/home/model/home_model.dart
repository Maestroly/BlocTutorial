class ProductModel {
  List<Comments>? comments;
  int? total;
  int? skip;
  int? limit;

  ProductModel({this.comments, this.total, this.skip, this.limit});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }
}

class Comments {
  int? id;
  String? body;
  int? postId;
  int? likes;
  User? user;

  Comments({this.id, this.body, this.postId, this.likes, this.user});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    body = json['body'];
    postId = json['postId'];
    likes = json['likes'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['body'] = body;
    data['postId'] = postId;
    data['likes'] = likes;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? fullName;

  User({this.id, this.username, this.fullName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['fullName'] = fullName;
    return data;
  }
}
