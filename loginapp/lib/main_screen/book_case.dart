


import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/main_screen/preview_box.dart';
import 'package:loginapp/main_screen/preview_case.dart';
import 'package:loginapp/main_screen/preview_new.dart';

import '../constant.dart';
import '../data/book.dart';

class BookCaseScreen extends StatefulWidget {
  const BookCaseScreen({super.key});
  @override
  BookCaseScreenState createState() => BookCaseScreenState();
}

class BookCaseScreenState extends State<BookCaseScreen> {
  List<Book> book_caseList = [];

  Future<List<Book>> getBookCase() async {
    final databaseReference = FirebaseDatabase.instance.ref();
    final snapshot = await databaseReference.child('books').once();
    final bookList = <Book>[];
    Map? booksJson = snapshot.snapshot.value as Map?;

    booksJson?.forEach((key, value) {
      final book = Book(
        title: value['title'],
        tags: List<String>.from(value['tags']),
        description: value['description'],
        cover: value['cover'],
        author: value['author'],
        chapterList: List<String>.from(value['chapterList']),
        follow: value['follow'],
      );
      if(book.follow == true){
        bookList.add(book);
      }
    });
    return bookList;
  }
  @override
  void initState() {
    super.initState();
    getBookCase().then((bookList) {
      setState(() {
        book_caseList = bookList;
      });
    });
  }

  final ScrollController _scrollController = ScrollController();
  void _scrollUp() {
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh sách yêu thích"),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          color: mainScreenBG,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              ListView.builder(
                    physics: const ScrollPhysics(),
                    itemCount: book_caseList.length,
                    // padding: const EdgeInsets.all(20),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => showDialog(
                          context: context,
                          builder: (context) => PreviewBox( 
                            title: book_caseList[index].title!,
                            tags: book_caseList[index].getTags()!,
                            description: book_caseList[index].description!,
                            cover: book_caseList[index].cover!,
                            author: book_caseList[index].author!,
                            chapterList: book_caseList[index].chapterList!,
                          ),
                        ),
                        child: PreviewCase(
                          title: book_caseList[index].title!,
                          author: book_caseList[index].author!,
                          tags: book_caseList[index].getTags()!,
                          cover: book_caseList[index].cover!,
                          newestChapter: book_caseList[index].chapterList!.last,
                        ),
                      );
                    },
                  ),
            ],
          ),
        ),
      ),
    );
  }
}