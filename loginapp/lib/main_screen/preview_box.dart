import 'package:flutter/material.dart';
import 'package:loginapp/constant.dart';
import 'book_page.dart';

class PreviewBox extends StatelessWidget {
  final String title;
  final String tags;
  final String description;
  final String cover;
  final String author;
  final List<String> chapterList;
  const PreviewBox({
    super.key,
    required this.title,
    required this.tags,
    required this.description,
    required this.cover,
    required this.author,
    required this.chapterList,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 650,
        width: 500,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: mainScreenBG,
            ),
            child: ListView(
              children: [
                Column(
                  children: [
                    Image.asset(
                      cover,
                      alignment: Alignment.topCenter,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: mainScreenText,
                        ),
                      ),
                    ),
                  ], // name
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Text(
                    'Tác giả: $author',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: mainScreenText,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                  child: Expanded(
                    child: // tag/genre
                        Text(
                      'Thể loại: $tags',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: mainScreenText,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Expanded(
                    child: // summary
                        Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: mainScreenText,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(90, 20, 90, 20),
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookPage(
                          cover: cover,
                          title: title,
                          author: author,
                          tags: tags,
                          description: description,
                          chapterList: chapterList,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                      backgroundColor: appBarBG,
                    ),
                    child: const Text(
                      'Đọc',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
