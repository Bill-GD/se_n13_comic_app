import 'package:flutter/material.dart';
class preview_month extends StatelessWidget{
  final String trending_image_month_pr;
  final String trending_title_month_pr;
  final String trending_des_month_pr;
  final String trending_tag_month_pr;
  final String author_month_tr;
  preview_month({required this.trending_image_month_pr, required this.trending_title_month_pr, required this.trending_des_month_pr, required this.trending_tag_month_pr, required this.author_month_tr});

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
          child: Image.network(trending_image_month_pr, alignment: Alignment.topCenter,),),
          Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0) ,
          child: Text(trending_title_month_pr, textAlign: TextAlign.center),),]//Lấy tên tác phẩm 
          ),
          Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0) ,
          child: 
          Expanded(
          child://Thể loại hay gọi là tag
          Text('Tác giả: '+ author_month_tr, textAlign: TextAlign.center),)
          ),
          Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0) ,
          child: 
          Expanded(
          child://Thể loại hay gọi là tag
          Text('Thể loại: '+ trending_tag_month_pr, textAlign: TextAlign.center),)
          ),
          Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0) ,
          child: 
          Expanded(
          child://Giới thiệu hay tóm tắt
          Text(trending_des_month_pr, textAlign: TextAlign.center)))
        
    ]
     
    ),
    )
    )
  
   );

}
}