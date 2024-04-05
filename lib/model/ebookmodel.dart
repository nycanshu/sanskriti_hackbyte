class EbookData {
  String? image;
  String? name;
  String? link;

  EbookData({this.image, this.name, this.link});

  EbookData.fromJson(Map<String, dynamic> json) {
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["link"] is String) {
      link = json["link"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["image"] = image;
    _data["name"] = name;
    _data["link"] = link;
    return _data;
  }
}
