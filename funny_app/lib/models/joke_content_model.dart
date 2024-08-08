class JokeContentModel {
  final String id;
  final String jokeContent;
  final bool? isFunny;

  JokeContentModel({required this.id, required this.jokeContent, this.isFunny});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'jokeContent': jokeContent,
      'isFunny': isFunny,
    };
  }

  factory JokeContentModel.fromJson(Map<String, dynamic> json) {
    return JokeContentModel(
      id: json['id'],
      jokeContent: json['jokeContent'],
      isFunny: json['isFunny'],
    );
  }
}
