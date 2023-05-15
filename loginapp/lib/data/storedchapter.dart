import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../main_screen/story_screen.dart';
// lấy dữ liệu từ api chapter
class ChapterList extends StatefulWidget {
  final String title;
  final String chapter;
  ChapterList({required this.title, required this.chapter});

  @override
  _ChapterListState createState() => _ChapterListState();
}

class _ChapterListState extends State<ChapterList> {
  List<String> chapterList = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  Future<void> fetchData() async {
    final databaseReference = FirebaseDatabase.instance.ref('chapter');
    final snapshot = await databaseReference.child(widget.title).child(widget.chapter).once();
    List<dynamic> chapsJson = snapshot.snapshot.value as List<dynamic>;
    chapsJson.forEach((value) {
      chapterList.add(value as String);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoryScreen(imageUrls: chapterList, title: widget.title, chapter: widget.chapter);
  }
}