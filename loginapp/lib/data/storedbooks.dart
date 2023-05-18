import 'package:firebase_database/firebase_database.dart';
import 'book.dart';
// import 'package:firebase_core/firebase_core.dart'; // unused import

final ref = FirebaseDatabase.instance.ref('books');
final top_entriesList = <Book>[];
final month_entriesList = <Book>[];

Future<List<Book>> getBooks() async {
  final databaseReference = FirebaseDatabase.instance.ref();
  final snapshot = await databaseReference.child('books').once();
  final bookList = <Book>[];
  Map? booksJson = snapshot.snapshot.value as Map?;

  booksJson?.forEach((key, value) {
    final book = Book(
      title: value['title'],
      tags: List<String>.from(value['tags']),
      description: value['description'],
      cover: value['cover'],
      author: value['author'],
      chapterList: List<String>.from(value['chapterList']),
      status: value['status'],
    );
    bookList.add(book);
    if(book.status == 1){
      top_entriesList.add(book);
    }else if(book.status == 2){
      month_entriesList.add(book);
    }
  });
  return bookList;
}



// var trendingEntries = <Book>[
//   Book(
//     title: 'Kimetsu no Yaiba',
//     tags: ['Fantasy, Historical, Shounen, Manga, Drama'],
//     description: 'Kimetsu no Yaiba _ Tanjirou là con cả của gia đình vừa mất cha.',
//     cover: 'https://iili.io/H8lnZap.jpg',
//     author: 'Gotouge Koyoharu',
//   ),
//   Book(
//     title: 'VÕ LUYỆN ĐỈNH PHONG',
//     tags: ['Action, Truyện màu,Supernatural, Shounen, Drama'],
//     description: 'Võ đạo đỉnh phong, là cô độc, là tịch mịch, là dài đằng đẵng cầu tác, là cao xử bất thắng hàn',
//     cover: 'https://iili.io/H8loQWu.jpg',
//     author: 'Đang cập nhật',
//   ),
//   Book(
//     title: 'Doreamon',
//     tags: ['Học đường, Lãng mạn, Shounen, Drama'],
//     description: 'Doreamon là một series manga của Nhật Bản do Fujiko F. Fujio sáng tác từ tháng 12 năm 1969 đến tháng 4 năm 1996 đăng trên tạp chí CoroCoro Comic của nhà xuất bản Shogakukan',
//     cover: 'https://iili.io/H8VmVfV.jpg',
//     author: 'Fujiko Fujio',
//   ),
//   Book(
//     title: 'SPY X FAMILY',
//     tags: ['Học đường, Lãng mạn, Shounen, Drama'],
//     description: 'Anh điệp viên lấy vợ sát thủ và có con siêu năng',
//     cover: 'https://iili.io/H8VpB1V.jpg',
//     author: 'Endou Tatsuya',
//   ),
//   Book(
//     title: 'Naruto -CỬU VĨ HỒ LY',
//     tags: ['Action, Comedy,  Drama, Fantasy, Manga, Seinen, Shounen'],
//     description: 'Naruto là một cậu bé có mơ ước trở thành hokage của làng Konoha,được Hokage phong ấn trong người một trong 9 quái vật của thể giới',
//     cover: 'https://iili.io/H8WJFyP.jpg',
//     author: 'Kishimoto Masashi',
//   ),
//   Book(
//     title: 'One Piece',
//     tags: ['Comedy, Action, Fantasy, Shounen, Supernatural, Drama'],
//     description: 'Câu chuyện sẽ xoay quanh nhân vật Ace huyền thoại và niềm khao khát chinh phục kho báu One Piece cực kì mãnh liệt của anh.',
//     cover: 'https://iili.io/H8W9Job.jpg',
//     author: 'Eiichiro Oda',
//   ),
//   Book(
//     title: 'TÔI LÀ LÍNH MỚI',
//     tags: ['Action - Adventure - Fantasy - Manhwa - Truyện Màu'],
//     description: '15 năm cho đến khi kết thúc trò chơi. Duy nhất chỉ có tôi biết cái kết - Tôi như là một món đồ cổ.',
//     cover: 'https://iili.io/H8W23I1.jpg',
//     author: 'Đang cập nhật',
//   ),
//   Book(
//     title: 'TIÊN VÕ ĐẾ TÔN',
//     tags: ['Action - Adventure - Cổ Đại - Fantasy - Manhua - Truyện Màu'],
//     description: 'Truyện tranh Tiên Võ Đế Tôn được cập nhật nhanh và đầy đủ nhất tai Commic App',
//     cover: 'https://iili.io/H8W30Pa.jpg',
//     author: 'Đang cập nhật',
//   ),
//   Book(
//     title: 'YÊU THẦN KÝ',
//     tags: ['Action - Fantasy - Manhua - Shounen - Truyện Màu'],
//     description: 'Yêu Thần Vừa Xuất, Ai Dám Tranh Phong',
//     cover: 'https://iili.io/H8W38lf.jpg',
//     author: 'Mad Snail',
//   ),
//   Book(
//     title: 'NÀNG NỔI LOẠN X CHÀNG THỢ MAY',
//     tags: ['Comedy - Manga - School Life - Slice of Life'],
//     description: 'Wakana Gojou 15 tuổi là 1 học sinh cao trung từng bị tổn thương tâm lý trong quá khứ do sở thích kỳ lạ của mình.',
//     cover: 'https://iili.io/H8WF2ig.jpg',
//     author: 'author',
//   ),
// ];

// var trendingMonthEntries = <Book>[
//   //thông tin top tháng
//   Book(
//     title: 'TÔI LÀ LÍNH MỚI',
//     tags: ['Action - Adventure - Fantasy - Manhwa - Truyện Màu'],
//     description: '15 năm cho đến khi kết thúc trò chơi. Duy nhất chỉ có tôi biết cái kết - Tôi như là một món đồ cổ.',
//     cover: 'https://iili.io/H8W23I1.jpg',
//     author: 'Đang cập nhật',
//   ),
//   Book(
//     title: 'One Piece',
//     tags: ['Comedy, Action, Fantasy, Shounen, Supernatural, Drama'],
//     description: 'Câu chuyện sẽ xoay quanh nhân vật Ace huyền thoại và niềm khao khát chinh phục kho báu One Piece cực kì mãnh liệt của anh.',
//     cover: 'https://iili.io/H8W9Job.jpg',
//     author: 'Eiichiro Oda',
//   ),
//   Book(
//     title: 'VÕ LUYỆN ĐỈNH PHONG',
//     tags: ['Action, Truyện màu,Supernatural, Shounen, Drama'],
//     description: 'Võ đạo đỉnh phong, là cô độc, là tịch mịch, là dài đằng đẵng cầu tác, là cao xử bất thắng hàn',
//     cover: 'https://iili.io/H8loQWu.jpg',
//     author: 'Đang cập nhật',
//   ),
//   Book(
//     title: 'NÀNG NỔI LOẠN X CHÀNG THỢ MAY',
//     tags: ['Comedy - Manga - School Life - Slice of Life'],
//     description: 'Wakana Gojou 15 tuổi là 1 học sinh cao trung từng bị tổn thương tâm lý trong quá khứ do sở thích kỳ lạ của mình.',
//     cover: 'https://iili.io/H8WF2ig.jpg',
//     author: 'author',
//   ),
  
//   Book(
//     title: 'Naruto -CỬU VĨ HỒ LY',
//     tags: ['Action, Comedy,  Drama, Fantasy, Manga, Seinen, Shounen'],
//     description: 'Naruto là một cậu bé có mơ ước trở thành hokage của làng Konoha,được Hokage phong ấn trong người một trong 9 quái vật của thể giới',
//     cover: 'https://iili.io/H8WJFyP.jpg',
//     author: 'Kishimoto Masashi',
//   ),
  
//   Book(
//     title: 'SPY X FAMILY',
//     tags: ['Học đường, Lãng mạn, Shounen, Drama'],
//     description: 'Anh điệp viên lấy vợ sát thủ và có con siêu năng',
//     cover: 'https://iili.io/H8VpB1V.jpg',
//     author: 'Endou Tatsuya',
//   ),
//   Book(
//     title: 'Kimetsu no Yaiba',
//     tags: ['Fantasy, Historical, Shounen, Manga, Drama'],
//     description: 'Kimetsu no Yaiba _ Tanjirou là con cả của gia đình vừa mất cha.',
//     cover: 'https://iili.io/H8lnZap.jpg',
//     author: 'Gotouge Koyoharu',
//   ),
  
//   Book(
//     title: 'TIÊN VÕ ĐẾ TÔN',
//     tags: ['Action - Adventure - Cổ Đại - Fantasy - Manhua - Truyện Màu'],
//     description: 'Truyện tranh Tiên Võ Đế Tôn được cập nhật nhanh và đầy đủ nhất tai Commic App',
//     cover: 'https://iili.io/H8W30Pa.jpg',
//     author: 'Đang cập nhật',
//   ),
//   Book(
//     title: 'YÊU THẦN KÝ',
//     tags: ['Action - Fantasy - Manhua - Shounen - Truyện Màu'],
//     description: 'Yêu Thần Vừa Xuất, Ai Dám Tranh Phong',
//     cover: 'https://iili.io/H8W38lf.jpg',
//     author: 'Mad Snail',
//   ),
//   Book(
//     title: 'Doreamon',
//     tags: ['Học đường, Lãng mạn, Shounen, Drama'],
//     description: 'Doreamon là một series manga của Nhật Bản do Fujiko F. Fujio sáng tác từ tháng 12 năm 1969 đến tháng 4 năm 1996 đăng trên tạp chí CoroCoro Comic của nhà xuất bản Shogakukan',
//     cover: 'https://iili.io/H8VmVfV.jpg',
//     author: 'Fujiko Fujio',
//   ),
  
// ];
