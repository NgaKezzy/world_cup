import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:worldcup_app/models/firebase/section.dart';

class HighLight {
  final String description;
  final String title;
  final String videoId;
  final String imageUrl;
  final String type;
  final String team;
  final List<Section> section;
  final Timestamp created;

  HighLight({
    required this.description,
    required this.title,
    required this.videoId,
    required this.imageUrl,
    required this.type,
    this.team = '',
    this.section = const [],
    required this.created,
  });
  factory HighLight.fromJson(Map<String, dynamic> json) {
    return HighLight(
      description: json['description'],
      imageUrl: json['image'],
      title: json['title'],
      videoId: json['videoId'],
      type: json['type'],
      team: json['team'],
      section: listSectionsFromJson(json['section']),
      created: json['created'],
    );
  }
}
