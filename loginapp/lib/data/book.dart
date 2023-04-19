// when getting the data from the database, map data using the class

class Book {
  String? title;
  List<String>? tags;
  String? description;
  String? cover;
  String? author;
  List<String>? chapterList = [];

  Book({
    required this.title,
    required this.tags,
    required this.description,
    required this.cover,
    required this.author,
    this.chapterList,
  }) {
    chapterList = [
      'Chương 1',
      'Chương 2',
      'Chương 3',
      'Chương 4',
      'Chương 5',
    ];
  }

  String? getTags() => tags?.join(", ");
}
