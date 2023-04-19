import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/constant.dart';

class TrendingMonth extends StatelessWidget {
  final String cover;
  final String title;
  const TrendingMonth({
    super.key,
    required this.cover,
    required this.title,
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
              child: Image.network(
                cover,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: mainScreenText,
              ),
            ),
          ],
        ),
      );
}
