import 'package:flutter/material.dart';
import 'package:loginapp/constant.dart';

class Preview extends StatelessWidget {
  final String bookChildTitle;
  final String bookChildTags;
  final String bookChildDesc;
  final String bookChildImage;
  final String bookChildAuthor;
  const Preview({
    super.key,
    required this.bookChildTitle,
    required this.bookChildTags,
    required this.bookChildDesc,
    required this.bookChildImage,
    required this.bookChildAuthor,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 600,
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
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Image.asset(
                        bookChildImage,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                      child: Text(
                        bookChildTitle,
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
                    'Tác giả: $bookChildAuthor',
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
                      'Thể loại: $bookChildTags',
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
                      bookChildDesc,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: mainScreenText,
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
