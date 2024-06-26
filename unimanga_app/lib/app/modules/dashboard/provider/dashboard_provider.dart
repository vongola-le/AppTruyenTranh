import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:unimanga_app/app/constants/index.dart';
import 'package:unimanga_app/app/models/comic_model.dart';

import '../../../models/user.dart';
import '../../../models/chap_comic.dart';

class DashboardProvider {
Future<List<ComicModel>> getComicListHot() async {
  try {
    DatabaseReference invoiceRef =
        stringFirebase.databaseconnect.ref('UniManga');
    DataSnapshot snapshot = (await invoiceRef.child('Truyen').once()).snapshot;
    List<ComicModel> comics = [];
    List<dynamic> values = snapshot.value as List<dynamic>;
    values.forEach((element) {
      comics.add(ComicModel.fromJson(element as Map<Object?, Object?>));
    });
    comics.sort((a, b) => int.parse(b.luotXem!).compareTo(int.parse(a.luotXem!)));
    print(comics);
    return comics;
  } catch (e) {
    print('Error loading comic: $e');
    return [];
  }
}
Future<List<ImageChap>> getImageChapComicById(String id, String idChuong) async {
  try {
    DatabaseReference comicRef = stringFirebase.databaseconnect.ref(stringFirebase.StringHost);
    DataSnapshot snapshot = (await comicRef.child('Truyen').child(id).child('ChuongTruyen').child(idChuong).child('AnhTruyen').once()).snapshot;
    List<ImageChap> imagechaps = [];
    List<dynamic> values = snapshot.value as List<dynamic>;
    values.forEach((element) {
      imagechaps.add(ImageChap.fromJson(element as Map<Object?, Object?>));
      
    });
    return imagechaps;
  } catch (e) {
    return [];
  }
    
}
Future<ComicModel?> getComicById(String id) async {
  try {
    DatabaseReference comicRef = stringFirebase.databaseconnect.ref(stringFirebase.StringHost);
    DataSnapshot snapshot = (await comicRef.child('Truyen').child(id).once()).snapshot;
    if (snapshot.value != null) {
      return ComicModel.fromJson(snapshot.value as Map<Object?, Object?>);
    } else {
      print("Comic with ID $id not found.");
      return null;
    }
  } catch (e) {
    print("Error loading comic by ID: $e");
    return null;
  }
}

Future<List<ComicModel>> getComicListWithCate(String cate) async {
  try {
    DatabaseReference comicRef = stringFirebase.databaseconnect.ref(stringFirebase.StringHost);
    DataSnapshot snapshot = (await comicRef.child('Truyen').once()).snapshot;
    List<ComicModel> comics = [];
    List<dynamic> values = snapshot.value as List<dynamic>;
    values.forEach((element) {
      ComicModel comic = ComicModel.fromJson(element as Map<Object?, Object?>);
      if (comic.theLoai!.any((theLoai) => theLoai.tenTheLoai == cate)) {
        comics.add(comic);
      }
    });
    return comics;
  } catch (e) {
    print("Error loading comic with cate: $e");
    return [];
  }
}
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
 Future<Users?> getUserByUid(String uid) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await _firestore.collection('Users').doc(uid).get();
      if (documentSnapshot.exists) {
        return Users.fromSnapshot(documentSnapshot);
      } else {
        print('User not found');
        return null;
      }
    } catch (e) {
      print('Error getting user data: $e');
      return null;
    }
  }

  Future<List<ComicModel>> getFilterComic(String stt) async {
    try {
      DatabaseReference comicRef =
          stringFirebase.databaseconnect.ref(stringFirebase.StringHost);
      DataSnapshot snapshot = (await comicRef.child('Truyen').once()).snapshot;
      List<ComicModel> comics = [];
      List<dynamic> values = snapshot.value as List<dynamic>;
      values.forEach((element) {
        ComicModel comic =
            ComicModel.fromJson(element as Map<Object?, Object?>);
        if (comic.theLoai!.any((theLoai) => theLoai.tenTheLoai == stt)) {
          comics.add(comic);
        }
      });
      return comics;
    } catch (e) {
      print("Error loading comic with cate: $e");
      return [];
    }
  }
}