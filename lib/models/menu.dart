class Menu {
  int _id;
  String _title;
  String _imagePath;

  Menu(this._title, this._imagePath);

  Menu.map(dynamic obj) {
    this._id = obj['id'];
    this._title = obj['title'];
    this._imagePath = obj['imagePath'];
  }

  int get id => _id;
  String get title => _title;
  String get imagePath => _imagePath;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['imagePath'] = _imagePath;

    return map;
  }

  Menu.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._imagePath = map['imagePath'];
  }
}