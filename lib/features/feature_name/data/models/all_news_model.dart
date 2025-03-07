/**
 *   "author": "AJ Dellinger",
      "title": "MicroStrategy Says Drop the Micro, It’s Cleaner",
      "description": "The tech company turned Bitcoin repository is changing its name.",
      "url": "https://gizmodo.com/microstrategy-says-drop-the-micro-its-cleaner-2000559905",
      "urlToImage": "https://gizmodo.com/app/uploads/2025/02/GettyImages-2039371693.jpg",
      "publishedAt": "2025-02-06T13:45:12Z",
      "content": "Michael Saylor is apparently d
 */
class AllNewsModel {
  final String? name;
  final String? author;
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  AllNewsModel({
    required this.name,
    required this.author,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory AllNewsModel.fromJson(Map<String, dynamic> json) {
    return AllNewsModel(
      name: json['source']['name'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}
