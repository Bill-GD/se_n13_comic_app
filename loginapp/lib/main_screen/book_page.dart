// import 'dart:async'; // unused import

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loginapp/constant.dart';
import 'package:loginapp/data/storedchapter.dart';
// import 'package:loginapp/main_screen/story_screen.dart'; // unused import
// import 'package:loginapp/utils/showSnackBar.dart'; // unused import

class BookPage extends StatefulWidget {
  final String cover;
  final String title;
  final String description;
  final String tags;
  final String author;
  final List<String> chapterList;
  const BookPage({
    super.key,
    required this.cover,
    required this.title,
    required this.description,
    required this.tags,
    required this.author,
    required this.chapterList,
  });

  @override
  BookPageState createState() => BookPageState();
}

class BookPageState extends State<BookPage> {
  final ScrollController _childScrollController = ScrollController();

  late bool isFollowing = false;

  @override
  void initState() {
    super.initState();
    DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref('books').child(widget.title).child('follow');
    starCountRef.onValue.listen((DatabaseEvent event) {
      bool data = event.snapshot.value as bool;
      setState(() {
        isFollowing = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
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
          child: ListView(
            children: [
              // book information
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    // cover
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      // use network when working with database
                      child: Image.network(
                        widget.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    // title
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: mainScreenText,
                        ),
                      ),
                    ),
                    // author
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 20,
                                color: mainScreenText,
                              ),
                              children: [
                                const WidgetSpan(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(2, 0, 10, 0),
                                    child: Icon(
                                      FontAwesomeIcons.userPen,
                                      color: Colors.amberAccent,
                                    ),
                                  ),
                                ),
                                TextSpan(text: 'Tác giả: ${widget.author}'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // tags
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 20,
                                color: mainScreenText,
                              ),
                              children: [
                                const WidgetSpan(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Icon(
                                      FontAwesomeIcons.tag,
                                      color: Colors.amberAccent,
                                    ),
                                  ),
                                ),
                                TextSpan(text: ' Thể loại: ${widget.tags}'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // description
                    Center(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 20),
                        child: Expanded(
                          child: Text(
                            widget.description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: mainScreenText,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // follow button
              Center(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: SizedBox(
                    child: Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // thay đổi trạng thái follow khi click nút
                          setState(() {
                            isFollowing = !isFollowing;
                          });
                          // cập nhật trạng thái follow lên firebase
                          final databaseReference = FirebaseDatabase.instance.ref();
                          databaseReference
                              .child('books')
                              .child(widget.title)
                              .update({'follow': isFollowing});
                        }, // follow function
                        style: ButtonStyle(
                          padding: MaterialStateProperty.resolveWith(
                              (states) => const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10)),
                          backgroundColor: MaterialStateColor.resolveWith((states) => appBarBG),
                          overlayColor: MaterialStateColor.resolveWith((states) => appBarBGLight),
                        ),
                        icon: Icon(
                          FontAwesomeIcons.solidHeart,
                          color: isFollowing ? Colors.red : Colors.grey,
                        ),
                        label: Text(
                          isFollowing ? 'Đã follow' : 'Follow',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            color: mainScreenText,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // chapter list
              Center(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Container(
                    height: 80,
                    width: 350,
                    color: appBarBG,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesomeIcons.list,
                          color: Colors.amberAccent,
                          size: 35,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Danh sách chương',
                          style: TextStyle(
                            fontSize: 30,
                            color: mainScreenText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(21, 0, 21, 0),
                  child: ListView.builder(
                    controller: _childScrollController,
                    shrinkWrap: true,
                    itemCount: widget.chapterList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 1, 0, 1),
                        child: SizedBox(
                          height: 80,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChapterList(
                                    index: index,
                                    title: widget.title,
                                    chapter:
                                        widget.chapterList[widget.chapterList.length - 1 - index],
                                    chapterList: widget.chapterList,
                                  ),
                                ),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(mainScreenBG),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: const BorderSide(
                                    width: 3,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              overlayColor:
                                  MaterialStateColor.resolveWith((states) => appBarBGLight),
                            ),
                            child: Text(
                              widget.chapterList[widget.chapterList.length - 1 - index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                                color: mainScreenText,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
