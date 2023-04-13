import 'package:flutter/material.dart';

class List extends StatelessWidget {
  final String bookChild;
  final String bookChildImage;
  const List({super.key, required this.bookChild, required this.bookChildImage});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
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
          SizedBox(
            height: 50,
            width: 85,
            child: Expanded(
              child: Text(
                bookChild,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
