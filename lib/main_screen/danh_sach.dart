import 'package:flutter/material.dart';
class danh_sach extends StatelessWidget{
  final String bookChild;
  danh_sach({required this.bookChild, required this.bookChild_Image, required this.bookChild_newest});
  final String bookChild_Image;
  final String bookChild_newest;
  @override
  Widget build(BuildContext context){
    return Padding(
            padding: const EdgeInsets.all(2.0),
          
              child: Column(
                children:[Stack(
                   alignment: AlignmentDirectional.bottomCenter,
                  children: [Container(
                height: 120,
                width: 90,
                
                child: Image.network(bookChild_Image, fit: BoxFit.contain,),
                ),
                Container(
                width: 90,
                color: Color.fromARGB(44, 214, 213, 213),
                child: Text(bookChild_newest,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold), textAlign: TextAlign.center,))//Lấy chương mới nhất
                ]
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