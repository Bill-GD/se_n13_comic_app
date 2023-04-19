import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrendingMonth extends StatelessWidget {
  final String trendingMonthCoverPreview;
  final String trendingMonthTitlePreview;
  const TrendingMonth({
    super.key,
    required this.trendingMonthCoverPreview,
    required this.trendingMonthTitlePreview,
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
              child: Image.network(
                trendingMonthCoverPreview,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 65,
              child: Text(
                trendingMonthTitlePreview,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
}
