class PhotoInfo {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  PhotoInfo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory PhotoInfo.fromJson(Map<String, dynamic> json) {
    return PhotoInfo(
      albumId: json["albumId"] as int,
      id: json["id"] as int,
      title: json["title"],
      url: json["url"],
      thumbnailUrl: json["thumbnailUrl"],
    );
  }
  //
}
