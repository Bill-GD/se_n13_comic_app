import 'package:flutter/material.dart';
import 'package:loginapp/constant.dart';

class PreviewNew extends StatelessWidget {
  final String title;
  final String cover;
  final String newestChapter;
  const PreviewNew({
    super.key,
    required this.title,
    required this.cover,
    required this.newestChapter,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: Image.asset(
                  cover,
                  fit: BoxFit.contain,
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: mainScreenText,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
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
        ],
      ),
    );
  }
}
