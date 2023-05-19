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
      insetPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 666,
        width: 516,
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(6),
                child: Container(
                  height: 650,
                  width: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: mainScreenBG,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.network(
                            cover,
                            alignment: Alignment.topCenter,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
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
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
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
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            child: Text(
                              'Thể loại: $tags',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: mainScreenText,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            child: Text(
                              description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: mainScreenText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(90, 10, 90, 10),
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
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith((states) => appBarBGLight),
                  padding: MaterialStateProperty.resolveWith(
                      (states) => const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5)),
                  backgroundColor: MaterialStateProperty.resolveWith((states) => appBarBG),
                ),
                child: const SizedBox(
                  width: 100,
                  child: Center(
                    child: Text(
                      'Đọc',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
