
import 'package:flutter/material.dart';
class preview extends StatelessWidget{
  final String bookChild;
   final String bookChild2;
  final String bookChild3;
  final String bookChild_Image;
 preview({required this.bookChild, required this.bookChild2, required this.bookChild3, required this.bookChild_Image});
 
@override
Widget build(BuildContext context){
 return Dialog(   
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Container(  
    height: 500,
    width: 200,
    child: Padding(padding: const EdgeInsets.all(8),
    child: ListView(
     children: [
        Column(children:[Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0) ,
          child: Image.asset(bookChild_Image, alignment: Alignment.topCenter,),),
          Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0) ,
          child: Text(bookChild, textAlign: TextAlign.center),),]//Lấy tên tác phẩm 
          ),
          Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0) ,
          child: 
          Expanded(
          child://Thể loại hay gọi là tag
          Text('Thể loại: '+ bookChild2, textAlign: TextAlign.center),)
          ),
          Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0) ,
          child: 
          Expanded(
          child://Giới thiệu hay tóm tắt
          Text(bookChild3, textAlign: TextAlign.center)))
        
    ]
     
    ),
    )
    )
  
   );

}
}