import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class trending_month extends StatelessWidget{
 final String trending_image_month_pr;
  final String trending_title_month_pr;
  trending_month({required this.trending_image_month_pr, required this.trending_title_month_pr});
@override
Widget build(BuildContext context) 
 =>Container(
        width: 80,
        height: 100,
        child: Column(
          
            children: [
            Container(
              height: 100,
              width: 70,
              child: Image.network(trending_image_month_pr,fit: BoxFit.fill)
              ),
              Container(
                width: 65,
                child: Text(trending_title_month_pr, textAlign: TextAlign.center,))
              
                ],),
          // thay thành Image.network
    
      );
 
}
