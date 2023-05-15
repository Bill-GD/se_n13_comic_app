import 'package:flutter/material.dart';
import 'package:loginapp/constant.dart';

class PreviewCase extends StatelessWidget {
  final String title;
  final String cover;
  final String author;
  final String tags;
  final String newestChapter;
  const PreviewCase({
    super.key,
    required this.author, required this.title, required this.cover, required this.newestChapter, required this.tags
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Container(
        decoration: BoxDecoration(
          color: mainScreenBG.withOpacity(1),
          border: Border.all(
            color: mainScreenText,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          boxShadow: [
            BoxShadow(
              color: shadow.withOpacity(0.55),
              offset: const Offset(5, 3),
              blurStyle: BlurStyle.outer,
              spreadRadius: 1,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              SizedBox(
                height: 150,
                width: 100,
                child: Image.network(
                  cover,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: mainScreenText,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Tác giả: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: mainScreenText,
                            ),
                          ),
                          TextSpan(
                            text: author,
                            style: TextStyle(
                              fontSize: 15,
                              color: mainScreenText,
                            ),
                          ),
                        ],
                      ),
                      // textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Thể loại: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: mainScreenText,
                            ),
                          ),
                          TextSpan(
                            text: tags,
                            style: TextStyle(
                              fontSize: 15,
                              color: mainScreenText,
                            ),
                          ),
                        ],
                      ),
                      // textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5),
                    Text(
                      newestChapter,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: mainScreenText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
