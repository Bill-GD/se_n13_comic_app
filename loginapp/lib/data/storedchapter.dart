import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http; // unused import
// import 'dart:convert'; // unused import
import '../main_screen/story_screen.dart';

// lấy dữ liệu từ api chapter
class ChapterList extends StatefulWidget {
  final int index;
  final String title;
  final String chapter;
  final List<String> chapterList;
  const ChapterList({
    super.key,
    required this.index,
    required this.title,
    required this.chapter,
    required this.chapterList,
  });

  @override
  _ChapterListState createState() => _ChapterListState();
}

class _ChapterListState extends State<ChapterList> {
  List<String> chapterPage = [];
  List<String> chapterList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    if (_isLoading) {
      final databaseReference = FirebaseDatabase.instance
          .ref('chapter')
          .child(widget.title)
          .child(widget.chapter);
      final snapshot = await databaseReference.once();
      List<dynamic> chapsJson = snapshot.snapshot.value as List<dynamic>;
      for (var value in chapsJson) {
        chapterList.add(value as String);
      }
      setState(() {
        chapterPage = chapterList;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return StoryScreen(
        index: widget.index,
        imageUrls: chapterPage,
        title: widget.title,
        chapter: widget.chapter,
        chapterList: widget.chapterList,
      );
    }
  }
}
