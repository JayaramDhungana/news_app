class FavouriteNewsModel {
  final String? name;
  final String? author;
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? publishedAt;

  FavouriteNewsModel({
    required this.name,
    required this.author,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
  });

  static Map<String, dynamic> toJson(FavouriteNewsModel value) {
    return {
      'name':value.name,
      'author':value.author,
      'title':value.title,
      'description':value.description,
      'urlToImage':value.urlToImage,
     ' publishedAt':value.publishedAt,
    };
  }
}
