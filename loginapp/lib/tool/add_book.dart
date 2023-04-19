import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loginapp/constant.dart';

class AddBook extends StatelessWidget {
  const AddBook({super.key});

  //tạm thời
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Đăng tác phẩm",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: mainScreenText,
            ),
          ),
          backgroundColor: appBarBG,
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft, //Nhập tên truyện
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: mainScreenText,
                    ),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      fillColor: appBarBG,
                      hintText: 'Nhập tên truyện',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: mainScreenText,
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.userPen,
                        color: iconColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft, //Nhập tác giả
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: mainScreenText,
                    ),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      fillColor: appBarBG,
                      hintText: 'Nhập tác giả',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: mainScreenText,
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.userPen,
                        color: iconColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft, //Nhập thể loại
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    //Nhập tên truyện
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: mainScreenText,
                    ),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      fillColor: appBarBG,
                      hintText: 'Nhập thể loại, cách nhau bằng dấu " , "',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: mainScreenText,
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.userPen,
                        color: iconColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft, //Nhập url ảnh hiện tại tôi chưa biết cách làm
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: mainScreenText,
                    ),
                    keyboardType: TextInputType.url,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      fillColor: appBarBG,
                      hintText: 'Nhập ảnh',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: mainScreenText,
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.userPen,
                        color: iconColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft, //Nhập giới thiệu
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    //Nhập tên truyện
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: mainScreenText,
                    ),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      fillColor: appBarBG,
                      hintText: 'Nhập giới thiệu',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: mainScreenText,
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.userPen,
                        color: iconColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft, //Nhập nội dung, nếu là novel
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    //Nhập tên truyện
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: mainScreenText,
                    ),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      fillColor: appBarBG,
                      hintText: 'Nhập nội dung (Tiếu thuyết)',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: mainScreenText,
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.userPen,
                        color: iconColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
