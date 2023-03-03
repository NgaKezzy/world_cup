List<Section> listSectionsFromJson(List<dynamic> json) =>
    json
        .map<Section>((player) => Section.fromJson(player))
        .toList();
class Section {
  final String type;
  final String content;

  Section({
    required this.type,
    required this.content,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      type: json['type'],
      content: json['content'],
    );
  }
}
