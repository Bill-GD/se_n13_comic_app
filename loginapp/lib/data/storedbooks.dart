import 'package:firebase_database/firebase_database.dart';
import 'book.dart';
// import 'package:firebase_core/firebase_core.dart'; // unused import

final ref = FirebaseDatabase.instance.ref('books');
final topEntries = <Book>[];
final monthEntries = <Book>[];

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
    if (book.status == 1) {
      topEntries.add(book);
    } else if (book.status == 2) {
      monthEntries.add(book);
    }
  });
  return bookList;
}
