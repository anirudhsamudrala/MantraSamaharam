class MenuItem {
  String id;
  String iconText;
  String iconImage ;
/*
  final MantraList mantraList;
*/
  final List<Mantra> mantras;

  MenuItem({this.id,this.iconText,this.iconImage,this.mantras});

  factory MenuItem.fromJson(Map<String, dynamic> json){

    var list = json['mantra'] as List;
    List<Mantra> mantras = list.map((i) => Mantra.fromJson(i)).toList();


    return MenuItem(
        id : json['id'],
        iconText : json['iconText'],
        iconImage:json['iconImage'],
        mantras : mantras
    );
  }
}

class Mantra{
  final String title;
  final String content;
  Mantra(this.title,this.content);
  Mantra.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'];
  Map<String, dynamic> toJson() =>
      {
        'title': title,
        'content': content
      };
}

class MantraList
{
  final List<Mantra> mantra;
  MantraList(this.mantra);
  MantraList.fromJson(Map<String, dynamic> json)
      : mantra = json['mantra'];
  Map<String, dynamic> toJson() =>
      {
        'mantra': mantra
      };
}