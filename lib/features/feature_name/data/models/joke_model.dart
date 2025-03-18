class JokeModel {
  final String? joke;
  final String? setup;
  final String? delivery;

  JokeModel({required this.joke, required this.setup, required this.delivery});

  factory JokeModel.fromJson(Map<String, dynamic> json) {
    return JokeModel(
      joke: json['joke'],
      setup: json['setup'],
      delivery: json['delivery'],
    );
  }
}
