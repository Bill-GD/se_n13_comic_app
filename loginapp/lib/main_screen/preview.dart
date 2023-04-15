import 'package:flutter/material.dart';
import 'package:loginapp/constant.dart';

class Preview extends StatelessWidget {
  final String bookChild;
  final String bookChild2;
  final String bookChild3;
  final String bookChildImage;
  const Preview(
      {super.key,
      required this.bookChild,
      required this.bookChild2,
      required this.bookChild3,
      required this.bookChildImage});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                        bookChild,
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                  child: Expanded(
                    child: // tag/genre
                        Text(
                      'Thể loại: $bookChild2',
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
                      bookChild3,
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
