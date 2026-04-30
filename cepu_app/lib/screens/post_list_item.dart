import 'package:cepu_app/models/post.dart';
import 'package:flutter/material.dart';

class PostListItem extends StatefulWidget {
  final Post post;
  final bool isOwner;

  const PostListItem({super.key, required this.post, required this.isOwner});

  // ignore: unused_element
  Future<void> _deletePost(BuildContext context) async {
    // Implementasi penghapusan post

  }
  @override
  State<PostListItem> createState() => _PostListItemState();
}

class _PostListItemState extends State<PostListItem> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
