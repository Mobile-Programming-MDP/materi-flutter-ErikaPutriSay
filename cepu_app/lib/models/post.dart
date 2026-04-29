import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String? id;
  String? Image;
  String? description;
  String? category;
  Timestamp? createdAt;
  Timestamp? updatedAt;
  String? latitude;
  String? longitude;
  String? userId;
  String? userFullName;

  Post({
    this.id,
    this.Image,
    this.description,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.latitude,
    this.longitude,
    this.userId,
    this.userFullName,
  });

  factory Post.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Post(
      id: doc.id,
      Image: data['image'],
      description: data['description'],
      category: data['category'],
      createdAt: data['created_at'] as Timestamp,
      updatedAt: data['updated_at'] as Timestamp,
      latitude: data['latitude'],
      longitude: data['longitude'],
      userId: data['user_id'],
      userFullName: data['user_full_name'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'image': Image,
      'description': description,
      'category': category,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'latitude': latitude,
      'longitude': longitude,
      'user_id': userId,
      'user_full_name': userFullName,
    };
  }
}
