
class Multimedia {
  String? type;
  String? src;
  int? height;
  int? width;

  Multimedia({this.type, this.src, this.height, this.width});

  Multimedia.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    src = json['src'];
    height = json['height'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['src'] = src;
    data['height'] = height;
    data['width'] = width;
    return data;
  }
}
