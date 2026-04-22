import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  String? id;
  final String title;
  final String description;
  String imageBase64;
  Timestamp? createdAt;
  Timestamp? updatedAt;

  Note({
    required this.id,
    required this.title,
    required this.description,
    required this.imageBase64,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Note.fromMap(Map<String, dynamic> data, String documentId) {
    return Note(
      id: documentId,
      title: data['title'],
      description: data['description'],
      imageBase64: data['image_base_64'],
      createdAt: data['created_at'] as Timestamp,
      updatedAt: data['updated_at'] as Timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'image_base_64': imageBase64,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
