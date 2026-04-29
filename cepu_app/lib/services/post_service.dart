import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class PostService {
  static final FirebaseFirestore _database = FirebaseFirestore.instance;
  static final CollectionReference _postsCollection = _database.collection('posts');
}

static Future<void> addPost(Post post) async {
  Map<String, dynamic> newPost = {
    'image': post.Image,
    'description': post.description,
    'category': post.category,
    'created_at': FieldValue.serverTimestamp(),
    'updated_at': FieldValue.serverTimestamp(),
    'latitude': post.latitude,
    'longitude': post.longitude,
    'user_id': post.userId,
    'user_full_name': post.userFullName,
  };
  await _postsCollection.add(newPost);  
}