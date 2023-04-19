import 'package:flutter/material.dart';

class PreviewMonth extends StatelessWidget {
  final String trendingMonthCover;
  final String trendingMonthTitle;
  final String trendingMonthDescription;
  final String trendingMonthTags;
  final String trendingMonthAuthor;
  const PreviewMonth({
    super.key,
    required this.trendingMonthCover,
    required this.trendingMonthTitle,
    required this.trendingMonthDescription,
    required this.trendingMonthTags,
    required this.trendingMonthAuthor,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
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
                    child: Image.network(
                      trendingMonthCover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: Text(
                      trendingMonthTitle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ], //Lấy tên tác phẩm
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Expanded(
                  child: Text(
                    'Tác giả: $trendingMonthAuthor',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Expanded(
                  child: Text(
                    'Thể loại: $trendingMonthTags',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Expanded(
                  child: Text(
                    trendingMonthDescription,
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
