import 'package:flutter/material.dart';
class danh_sach extends StatelessWidget{
  final String bookChild;
  danh_sach({required this.bookChild, required this.bookChild_Image});
  final String bookChild_Image;
  @override
  Widget build(BuildContext context){
    return Padding(
            padding: const EdgeInsets.all(2.0),
          
              child: Column(
                children:[
              Container(
                height: 120,
                width: 90,
                color: Colors.red,
                child: Image.asset(bookChild_Image/* thay thành  Image.network(bookChild_Image)  để lấy ảnh từ sever */, fit: BoxFit.fill,),
                ),
           Container(
            height: 50,
            width: 85,
            child: Expanded(  
                child: Text(bookChild, maxLines: 3,overflow:  TextOverflow.ellipsis, style: TextStyle(fontSize: 15), textAlign: TextAlign.center,),
              
              ),)
            ],)
            
            
              
                 
      );
      
  }
}