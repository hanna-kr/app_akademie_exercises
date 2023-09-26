class Post {
  String title;
  String text;

  Post({required this.title, required this.text});

  factory Post.fromJson(Map<String, dynamic> json) =>
      Post(title: json['title'], text: json['body']);
}
