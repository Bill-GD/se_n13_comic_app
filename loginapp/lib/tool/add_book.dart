// import 'dart:convert'; // unused import
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loginapp/constant.dart';
// import 'package:http/http.dart' as http; // unused import
import '../data/book.dart';


class AddBook extends StatelessWidget {
  const AddBook({super.key});
  @override
  Widget build(BuildContext context) {
    Future<void> saveData(Book newBook) async {
      // ignore: deprecated_member_use
      DatabaseReference dbRef = FirebaseDatabase.instance.reference();
      await dbRef.child('books').push().set({
        'title': newBook.title,
        'tags': newBook.tags,
        'description': newBook.description,
        'cover': newBook.cover,
        'author': newBook.author,
        'chapterList': newBook.chapterList,
        'status': newBook.status,
        'follow': newBook.follow,
      });
    }
    TextEditingController _txtTentruyen = TextEditingController();
    TextEditingController _txtTacgia = TextEditingController();
    TextEditingController _txtTheloai = TextEditingController();
    TextEditingController _txtNoidung = TextEditingController();
    TextEditingController _txturlanh = TextEditingController();
    return Scaffold(
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
        body: Container(
          color: mainScreenBG,
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft, //Nhập tên truyện
                    margin: const EdgeInsets.all(10),
                    child: TextField(
                      controller: _txtTentruyen,
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
                      controller: _txtTacgia,
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
                      controller: _txtTheloai,
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
                      controller: _txturlanh,
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
                      controller: _txtNoidung,
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
                  ElevatedButton(
                    onPressed: () async {
                        List<String> tagsList = _txtTheloai.text.split(", ");
                        Book newBook = Book(title: _txtTentruyen.text, tags: tagsList, description: _txtNoidung.text, cover: _txturlanh.text, author: _txtTacgia.text, chapterList: ["Chương1", "Chương 2", "Chương 3"], status: 0, follow: false);
                        saveData(newBook);                                    
                    },
                    child: const Text('Đăng truyện mới'),
                  ),
                ],   
              ),
            ],
          ),
        ),
      );
  }
}
