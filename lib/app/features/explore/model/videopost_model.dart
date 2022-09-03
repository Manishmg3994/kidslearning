class Post {
  String? title;
  String? imageUrl;
  String? videoUrl;

  int? indx; //array for shorting todo

  Post({this.title, this.imageUrl, this.videoUrl, this.indx});

  Post.fromJson(Map<String, dynamic> json)
      : this(
            title: json['title']! as String,
            imageUrl: json['imageUrl']! as String,
            videoUrl: json['videoUrl'] as String,
            indx: json["indx"]! as int);
  Map<String, dynamic> toJson() => {
        'title': title,
        'imageUrl': imageUrl,
        'videoUrl': videoUrl,
        "indx": indx
      };
}
