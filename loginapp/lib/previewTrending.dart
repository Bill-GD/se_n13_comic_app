import 'package:flutter/material.dart';

class PreviewTrending extends StatelessWidget {
  final String trendingImagePreview;
  final String trendingTitlePreview;
  final String trendingDescPreview;
  final String trendingTagPreview;
  const PreviewTrending(
      {super.key,
      required this.trendingImagePreview,
      required this.trendingTitlePreview,
      required this.trendingDescPreview,
      required this.trendingTagPreview});
  @override
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
                      trendingImagePreview,
                      alignment: Alignment.topCenter,
                    ),
                  ), // preview image
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: Text(
                      trendingTitlePreview,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ], // Name
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Expanded(
                  // tag/genre
                  child: Text(
                    'Thể loại: $trendingTagPreview',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Expanded(
                  // description/summary
                  child: Text(
                    trendingDescPreview,
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
