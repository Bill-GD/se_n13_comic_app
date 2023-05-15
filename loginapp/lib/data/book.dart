
class Book {
  String? title;
  List<String>? tags;
  String? description;
  String? cover;
  String? author;
  List<String>? chapterList = [];
  bool? follow = false;
  int? status = 0; // 0, 1, 2 => entries, 1 => top_trending, 2 => moth_trending

  Book({
    required this.title,
    required this.tags,
    required this.description,
    required this.cover,
    required this.author,
    this.chapterList,
    this.follow,
    this.status
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'tags': tags,
        'description': description,
        'cover': cover,
        'author': author,
        'chapterList': chapterList,
      };

  String? getTags() => tags?.join(", ");
}
