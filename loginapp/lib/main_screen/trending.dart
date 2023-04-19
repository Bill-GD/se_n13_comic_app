import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/constant.dart';

class TrendingBar extends StatelessWidget {
  final String trendingTitle;
  final String trendingImage;
  const TrendingBar({
    super.key,
    required this.trendingTitle,
    required this.trendingImage,
  });
  @override
  Widget build(BuildContext context) => SizedBox(
        width: 150,
        height: 100,
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(
                trendingImage,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              trendingTitle,
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
