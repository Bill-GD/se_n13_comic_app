import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class nhap_info extends StatelessWidget {//tạm thời
@override
Widget build(BuildContext context)=> Scaffold(
  appBar:AppBar(title: Text("Đăng tác phẩm",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),
  backgroundColor: Color.fromARGB(255, 0, 255, 132),
  ),
  body: ListView(
    children: [
      Column(
        children: [
          Container(alignment: Alignment.centerLeft,//Nhập tên truyện
    margin: const EdgeInsets.all(10),
      child: 
        TextField(
        keyboardType: TextInputType.text,
        decoration:
            InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
            filled: true,
            fillColor: Color.fromARGB(255, 0, 255, 132),
            hintText: 'Nhập tên truyện', 
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            prefixIcon: Icon(FontAwesomeIcons.book)
            )
      )
      ),
      Container(alignment: Alignment.centerLeft,//Nhập tác giả
    margin: const EdgeInsets.all(10),
      child: 
        TextField(
        keyboardType: TextInputType.text,
        decoration:
            InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
            filled: true,
            fillColor: Color.fromARGB(255, 0, 255, 132),
            hintText: 'Nhập tác giả', 
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            prefixIcon: Icon(FontAwesomeIcons.userPen)
            )
      )
      ),
      Container(alignment: Alignment.centerLeft,//Nhập thể loại
    margin: const EdgeInsets.all(10),
      child: 
        TextField(//Nhập tên truyện
        keyboardType: TextInputType.text,
        decoration:
            InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
            filled: true,
            fillColor: Color.fromARGB(255, 0, 255, 132),
            hintText: 'Nhập thể loại, cách nhau bằng dấu " , "', 
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            prefixIcon: Icon(FontAwesomeIcons.tag)
            )
      )
      ),
      Container(alignment: Alignment.centerLeft,//Nhập url ảnh hiện tại tôi chưa biết cách làm
    margin: const EdgeInsets.all(10),
      child: 
        TextField(
        keyboardType: TextInputType.url,
        decoration:
            InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
            filled: true,
            fillColor: Color.fromARGB(255, 0, 255, 132),
            hintText: 'Nhập ảnh', 
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            prefixIcon: Icon(FontAwesomeIcons.image)
            )
      )
      ),
      Container(alignment: Alignment.centerLeft,//Nhập giới thiệu
    margin: const EdgeInsets.all(10),
      child: 
        TextField(//Nhập tên truyện
        keyboardType: TextInputType.text,
        decoration:
            InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
            filled: true,
            fillColor: Color.fromARGB(255, 0, 255, 132),
            hintText: 'Nhập giới thiệu', 
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            prefixIcon: Icon(FontAwesomeIcons.userPen)
            )
      )
      ),
      Container(alignment: Alignment.centerLeft,//Nhập nội dung, nếu là novel
    margin: const EdgeInsets.all(10),
      child: 
        TextField(//Nhập tên truyện
        keyboardType: TextInputType.text,
        decoration:
            InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
            filled: true,
            fillColor: Color.fromARGB(255, 0, 255, 132),
            hintText: 'Nhập nội dung (Tiếu thuyết)', 
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            prefixIcon: Icon(FontAwesomeIcons.userPen)
            )
      )
      ),
        ],
      )
    ],
  ),
  );
}