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

  get value => null;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'score': score,
    };
  }

  factory Users.fromSnapshot(DocumentSnapshot<Map<dynamic, dynamic>?> document) {
    final data = document.data();

  
    if (data == null) {
      throw StateError("Missing data for Users from snapshot");
    }

    return Users(
      id: int.tryParse(document.id) ?? 0,
      imageUrl: data['imageUrl'] as String?,
      name: data['name'] as String?,
      email: data['Email'] as String? ?? '', 
      password: data['password'] as String?,
      score: data['score'] as int?,
    );
  }
}
