class Api {
  String? id;
  String? author;
  int? width;
  int? height;
  String? url;
  String? download_url;

  Api({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.download_url,
  });
  Api.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toString();
    author = json["author"]?.toString();
    width = json["width"]?.toInt();
    height = json["height"]?.toInt();
    url = json["url"]?.toString();
    download_url = json["download_url"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["author"] = author;
    data["width"] = width;
    data["height"] = height;
    data["url"] = url;
    data["download_url"] = download_url;
    return data;
  }
}
