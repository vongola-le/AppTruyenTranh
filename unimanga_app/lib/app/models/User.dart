class User {
  final int id;
  final String imageUrl;
  final String name;
  final int score;

  User({
    required this.id,
    required this.imageUrl,
  required this.name,
    required this.score,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'name': name,
      'score': score,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      imageUrl: json['imageUrl'] as String,
      name: json['name'] as String,
      score: json['score'] as int,
    );
  }
}