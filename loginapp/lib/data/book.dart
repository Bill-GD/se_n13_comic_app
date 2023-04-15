class Book {
  String? title;
  List<String>? tags;
  String? description;
  String? cover;

  Book(
      {required this.title,
      required this.tags,
      required this.description,
      required this.cover});

  String? getTags() => tags?.join(", ");
}
