class Link {
  String? type;
  String? url;
  String? suggestedLinkText;

  Link({this.type, this.url, this.suggestedLinkText});

  Link.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
    suggestedLinkText = json['suggested_link_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['url'] = url;
    data['suggested_link_text'] = suggestedLinkText;
    return data;
  }
}
