class News {
  Source source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;
  News(
      {required this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.content,
      this.publishedAt,
      this.urlToImage});
  factory News.fromJson(Map<String, dynamic> json) {
    DateTime? publishedAt;
    if (json['publishedAt'] != null) {
      publishedAt = DateTime.parse(json['publishedAt']);
    }
    if (publishedAt != null && publishedAt.isUtc) {
      publishedAt = publishedAt.toLocal();
    }
    return News(
        source:
            json["source"] != null ? Source.fromJson(json["source"]) : Source(),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        content: json["content"],
        urlToImage: json["urlToImage"]);
  }

  static List<News> parseList(Map<String, dynamic> result) {
    List list = (result['articles'] as List);
    return list.map((i) => News.fromJson(i)).toList();
  }
}

class Source {
  String? id;
  String? name;
  Source({this.id, this.name});
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json["id"], name: json["name"]);
  }
}
