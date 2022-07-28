class Photo {
  final String title;
  final int id;
  final String thumbnailUrl;
  final String url;
  Photo(this.title, this.id, this.thumbnailUrl, this.url);
  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(json["title"], json["id"], json["thumbnailUrl"], json["url"]);
  }
  static List<Photo> parseList(List<dynamic> list) {
    return list.map((i) => Photo.fromJson(i)).toList();
  }
}
