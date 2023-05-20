import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../constant.dart';

class Comments extends StatefulWidget {
  final String title;
  final String postId;
  final String postOwnerId;
  final String postMediaUrl;
  const Comments({
    super.key,
    required this.title,
    required this.postId,
    required this.postOwnerId,
    required this.postMediaUrl,
  });
  @override
  // ignore: no_logic_in_create_state
  CommentsState createState() => CommentsState(
        tieude: title,
        postId: postId,
        postOwnerId: postOwnerId,
        postMediaUrl: postMediaUrl,
      );
}

class CommentsState extends State<Comments> {
  TextEditingController commentController = TextEditingController();
  final String tieude;
  // ignore: deprecated_member_use
  DatabaseReference commentsRef = FirebaseDatabase.instance.ref('comments');
  final DateTime timestamp = DateTime.now();
  final user = FirebaseAuth.instance.currentUser!;
  final String postId;
  final String postOwnerId;
  final String postMediaUrl;
  CommentsState({
    required this.tieude,
    required this.postId,
    required this.postOwnerId,
    required this.postMediaUrl,
  });

  addComment() {
    commentsRef
        .child(tieude)
        .child(postId.replaceFirst('@gmail.com', ''))
        .child('comments')
        .push()
        .set({
      "username": user.displayName,
      "comment": commentController.text,
      "timestamp": timestamp.toString(),
      "avatarUrl": user.photoURL,
      "userId": user.email,
    });
    commentController.clear();
  }

  buildComments() {
    return StreamBuilder(
      stream: commentsRef
          .child(tieude)
          .child(postId.replaceFirst('@gmail.com', ''))
          .child('comments')
          .orderByChild("timestamp")
          .onValue,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.data.snapshot.value == null) {
          return const Center(
            child: Text(
              "Không có bình luận",
              style: TextStyle(color: Colors.grey),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("Đã xảy ra lỗi: ${snapshot.error}");
        } else {
          List<Comment> comments = [];
          final comment = Map<dynamic, dynamic>.from(
              (snapshot.data! as DatabaseEvent).snapshot.value as Map<dynamic, dynamic>);
          if (comment.isEmpty) {
            return Container();
          }
          comment.forEach((key, value) {
            final currentMessage = Map<String, dynamic>.from(value);
            comments.add(Comment(
              username: currentMessage['username'],
              userId: currentMessage['userId'],
              avatarUrl: currentMessage['avatarUrl'],
              comment: currentMessage['comment'],
              timestamp: DateTime.parse(currentMessage['timestamp']),
            ));
          });
          return ListView(
            children: comments,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bình luận',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: mainScreenText,
          ),
        ),
        backgroundColor: appBarBG,
      ),
      body: Container(
        color: mainScreenBG,
        child: Column(
          children: [
            Expanded(child: buildComments()),
            const Divider(),
            ListTile(
              tileColor: mainScreenTextLight,
              title: TextFormField(
                style: TextStyle(
                  color: mainScreenText,
                ),
                controller: commentController,
                decoration: const InputDecoration(labelText: "Nhập bình luận..."),
              ),
              trailing: OutlinedButton(
                onPressed: addComment,
                child: const Text("Gửi"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Comment extends StatelessWidget {
  final String username;
  final String userId;
  final String avatarUrl;
  final String comment;
  final DateTime timestamp;
  const Comment({
    super.key,
    required this.username,
    required this.userId,
    required this.avatarUrl,
    required this.comment,
    required this.timestamp,
  });

  factory Comment.fromDocument(DataSnapshot snapshot) {
    return Comment(
      username: snapshot.child('username').value.toString(),
      userId: snapshot.child('userId').value.toString(),
      comment: snapshot.child('comment').value.toString(),
      timestamp: DateTime.parse(snapshot.child('timestamp').value.toString()),
      avatarUrl: snapshot.child('avatarUrl').value.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(avatarUrl),
          ),
          title: Text(
            username,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: mainScreenText,
            ),
          ),
          subtitle: Text(
            comment,
            style: TextStyle(
              fontSize: 14,
              color: mainScreenText,
            ),
          ),
          trailing: Text(
            timeago.format(timestamp),
            style: TextStyle(
              fontSize: 12,
              color: mainScreenTextLight,
            ),
          ),
        ),
      ],
    );
  }
}
