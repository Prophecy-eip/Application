import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    required this.description,
    required this.pictures,
  });

  String description;
  List<String> pictures;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        description: json["description"],
        pictures: List<String>.from(json["pictures"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "pictures": List<dynamic>.from(pictures.map((x) => x)),
      };
}
