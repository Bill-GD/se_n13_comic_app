import 'package:flutter/material.dart';
import 'constant.dart';

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
        height: 600,
        width: 500,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: mainScreenBG,
            ),
            child: ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Image.asset(
                        trendingImagePreview,
                        alignment: Alignment.topCenter,
                      ),
                    ), // preview image
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                      child: Text(
                        trendingTitlePreview,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: mainScreenText,
                        ),
                      ),
                    ),
                  ], // Name
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                  child: Expanded(
                    // tag/genre
                    child: Text(
                      'Thể loại: $trendingTagPreview',
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
                    // description/summary
                    child: Text(
                      trendingDescPreview,
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
