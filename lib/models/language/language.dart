class Language {
  String name;
  String nameShort;
  String nameCode;
  bool isActive;
  Language({
    required this.name,
    this.isActive = false,
    required this.nameShort,
    required this.nameCode,
  });
}
