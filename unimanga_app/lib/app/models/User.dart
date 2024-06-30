import 'package:cloud_firestore/cloud_firestore.dart';

// class Users {
//   final int? id;
//   final String? imageUrl;
//   final String? name;
//   final String email;
//   final String? address;
//   final String password;
//   final int? score;

//   Users({
//     this.id,
//     this.imageUrl,
//     this.name,
//     required this.email,
//     this.address,
//     required this.password,
//     this.score,
//   });

//   toJson() {
//     return {
//       'imageUrl': imageUrl,
//       'name': name,
//       "email": email,
//       "address": address,
//       "password": password,
//       'score': score,
//     };
//   }

//   factory Users.fromSnapshot(
//       DocumentSnapshot<Map<dynamic, dynamic>?> document) {
//     final data = document.data()!;
//     return Users(
//       id: int.parse(document.id),
//       imageUrl: data['imageUrl'],
//       name: data['name'],
//       email: data['email'],
//       address: data['address'],
//       password: data['password'],
//       score: data['score'] as int,
//     );
//   }
// }

// class Users {
//   String? id;
//   String? imageUrl;
//   String? name;
//   String? email;
//   String? address;
//   String? password;
//   int? score;

//   Users({
//     this.id,
//     this.imageUrl,
//     this.name,
//     this.email,
//     this.address,
//     this.password,
//     this.score,
//   });

//   Users.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     imageUrl = json['imageUrl'];
//     name = json['name'];
//     email = json['email'];
//     address = json['address'];
//     password = json['password'];
//     score = json['score'] as int;
//   }
// }


class Users {
  final int? id;
  final String? imageUrl;
  final String? name;
  final String email;
  final String? address;
  final String? password;
  final int? score;

  Users({
    this.id,
    this.imageUrl,
    this.name,
    required this.email,
    this.address,
    this.password,
    this.score,
  });

  get value => null;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'address': address,
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
      email: data['email'] as String? ?? '', 
      address: data['address'] as String?,
      password: data['password'] as String?,
      score: data['score'] as int?,
    );
  }
}