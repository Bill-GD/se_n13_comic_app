import 'package:flutter/material.dart';
class preview_trending extends StatelessWidget{
  final String trending_image_pr;
  final String trending_title_pr;
  final String trending_des_pr;
  final String trending_tag_pr;
  final String author_tr;
  preview_trending({required this.trending_image_pr, required this.trending_title_pr, required this.trending_des_pr, required this.trending_tag_pr, required this.author_tr});
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
          child: Image.network(trending_image_pr, alignment: Alignment.topCenter,),),
          Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0) ,
          child: Text(trending_title_pr, textAlign: TextAlign.center),),]//Lấy tên tác phẩm 
          ),
          Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0) ,
          child: 
          Expanded(
          child://Thể loại hay gọi là tag
          Text('Tác giả: '+ author_tr, textAlign: TextAlign.center),)
          ),
          Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0) ,
          child: 
          Expanded(
          child://Thể loại hay gọi là tag
          Text('Thể loại: '+ trending_tag_pr, textAlign: TextAlign.center),)
          ),
          Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0) ,
          child: 
          Expanded(
          child://Giới thiệu hay tóm tắt
          Text(trending_des_pr, textAlign: TextAlign.center)))
        
    ]
     
    ),
    )
    )
  
   );
}
}