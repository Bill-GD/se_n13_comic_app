import 'package:flutter/material.dart';

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
        height: 500,
        width: 200,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: Image.asset(
                      bookChildImage,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: Text(
                      bookChild,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ], // name
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Expanded(
                  child: // tag/genre
                      Text(
                    'Thể loại: $bookChild2',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Expanded(
                  child: // summary
                      Text(
                    bookChild3,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
