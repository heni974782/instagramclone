import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/pages/home.dart';
import 'package:fluttershare/widgets/header.dart';
import 'package:fluttershare/widgets/post.dart';
import 'package:fluttershare/widgets/progress.dart';

class PostScreen extends StatelessWidget {
  final String userId;
  final String postId;

  PostScreen({
    required this.userId,
    required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: postsRef.doc(userId).collection('userPosts').doc(postId).get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          }
          Post post = Post.fromDocument(snapshot.data as DocumentSnapshot);
          return Center(
            child: Scaffold(
              appBar: header(context, titleText: post.description),
              body: ListView(
                children: <Widget>[
                  Container(
                    child: post,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
