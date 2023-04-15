import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/constant.dart';

class TrendingBar extends StatelessWidget {
  final String bookChildTrendingTitle;
  final String bookChildTrendingImage;
  const TrendingBar({
    super.key,
    required this.bookChildTrendingTitle,
    required this.bookChildTrendingImage,
  });
  @override
  Widget build(BuildContext context) => SizedBox(
        width: 80,
        height: 100,
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 70,
              child: Image.asset(
                bookChildTrendingImage,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              bookChildTrendingTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: mainScreenText,
              ),
            )
          ],
        ),
      );
}
