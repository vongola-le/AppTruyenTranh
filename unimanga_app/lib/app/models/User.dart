import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final int? id;
  final String? imageUrl;
  final String? name;
  final String email;
  final String? password;
  final int? score;

  Users({
   this.id,
    this.imageUrl,
    this.name,
    required this.email,
    this.password,
    this.score,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      "email": email,
      "password": password,
      'score': score,
    };
  }

  factory Users.fromSnapshot(DocumentSnapshot<Map<dynamic, dynamic>?> document) {
     final data = document.data()!;
    return Users(
      id: int.parse(document.id),
      imageUrl: data['imageUrl'],
      name: data['name'],
      email: data['Email'],
      password: data['Password'],
      score: data['score'] as int,
    );
  }
}