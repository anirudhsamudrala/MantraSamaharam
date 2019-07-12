class MenuItem {
  String id;
  String iconText;
  String iconImage;

  final List<Mantra> mantras;

  MenuItem({this.id, this.iconText, this.iconImage, this.mantras});

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    var list = json['mantra'] as List;
    List<Mantra> mantras = list.map((i) => Mantra.fromJson(i)).toList();

    return MenuItem(
        id: json['id'],
        iconText: json['iconText'],
        iconImage: json['iconImage'],
        mantras: mantras);
  }
}

class Mantra {
  final String title;
  final String subtitle;
  final String thumbnail;
  final String content;
  final String subcontent;

  Mantra(
      this.title, this.subtitle, this.thumbnail, this.content, this.subcontent);

  Mantra.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        subtitle = json['subtitle'],
        thumbnail = json['thumbnail'],
        content = json['content'],
        subcontent = json['subcontent'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'subtitle': subtitle,
        'thumbnail': thumbnail,
        'content': content,
        'subcontent': subcontent
      };
}

class MantraList {
  final List<Mantra> mantra;

  MantraList(this.mantra);

  MantraList.fromJson(Map<String, dynamic> json) : mantra = json['mantra'];

  Map<String, dynamic> toJson() => {'mantra': mantra};
}
