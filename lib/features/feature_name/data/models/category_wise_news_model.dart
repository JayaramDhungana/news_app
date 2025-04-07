/**Yo model ko lagi chahine kuraharu
 * {
  "status": "ok",
  "totalResults": 36,
  "articles": [
    {
      "source": {
        "id": "cnn",
        "name": "CNN"
      },
      "author": "Mary Gilbert, Taylor Ward, Artemis Moshtaghian, Phil Gast",
      "title": "Millions in path as storm kills 2, brings fierce winds, blizzard conditions and fires - CNN",
      "description": "A mammoth and multifaceted storm – which was dealing wind, fire, choking dust and the threat of a blizzard – pummeled much of the country as it marched east overnight.",
      "url": "https://www.cnn.com/2025/03/05/weather/storm-tornado-blizzard-fire-outage-hnk/index.html",
      "urlToImage": "https://media.cnn.com/api/v1/images/stellar/prod/ap25063654756032.jpg?c=16x9&q=w_800,c_fill",
      "publishedAt": "2025-03-05T05:55:00Z",
      "content": "A mammoth and multifaceted storm which was dealing wind, fire, choking dust and the threat of a blizzard pummeled much of the country as it marched east overnight.\r\nThe sky over Dallas resembled a Ma… [+6044 chars]"
    },
 * 
 */
class CategoryWiseNewsModel {
  final String? name;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  CategoryWiseNewsModel({
    required this.name,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory CategoryWiseNewsModel.fromJson(Map<String, dynamic> json) {
    return CategoryWiseNewsModel(
      name: json['source']['name'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}
