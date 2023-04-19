class Book {
  String? title;
  List<String>? tags;
  String? description;
  String? cover;
  String? author;

  Book({
    required this.title,
    required this.tags,
    required this.description,
    required this.cover,
    required this.author,
  });

  String? getTags() => tags?.join(", ");
}
