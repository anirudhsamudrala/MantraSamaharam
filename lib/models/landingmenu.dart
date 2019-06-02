class LandingMenu {
  final int id;
  final String iconImagePath;
  final String iconImageText;

  LandingMenu({this.id, this.iconImagePath, this.iconImageText});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'iconImagePath': iconImagePath,
      'iconImageText': iconImageText,
    };
  }

  // Implement toString to make it easier to see information about each dog when
  // using the print statement.
  @override
  String toString() {
    return 'LandingMenu{id: $id, iconImagePath: $iconImagePath, iconImageText: $iconImageText}';
  }
}