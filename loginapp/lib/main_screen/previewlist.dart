import 'package:flutter/material.dart';
import 'package:loginapp/constant.dart';

class PreviewList extends StatelessWidget {
  final String bookChild;
  final String bookChildImage;
  final String bookChildNewest;
  const PreviewList({
    super.key,
    required this.bookChild,
    required this.bookChildImage,
    required this.bookChildNewest,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                height: 120,
                width: 90,
                color: Colors.red,
                child: Image.asset(
                  bookChildImage /* thay thành  Image.network(bookChild_Image)  để lấy ảnh từ sever */,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: 90,
                color: const Color.fromARGB(44, 214, 213, 213),
                child: Text(
                  bookChildNewest,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ), //Lấy chương
            ],
          ),
          SizedBox(
            height: 50,
            width: 85,
            child: Expanded(
              child: Text(
                bookChild,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: mainScreenText,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
