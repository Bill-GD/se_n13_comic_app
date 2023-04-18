import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class trending_bar extends StatelessWidget{
  final String bookChild_trending_title;
  final String bookChild_trending_image;
  trending_bar({required this.bookChild_trending_title, required this.bookChild_trending_image});
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
              child: Image.network(bookChild_trending_image,fit: BoxFit.fill)
              ),
              Container(
                width: 65,
                child: Text(bookChild_trending_title, textAlign: TextAlign.center,))
              
                ],),
          // thay thành Image.network
    
      );
 
}