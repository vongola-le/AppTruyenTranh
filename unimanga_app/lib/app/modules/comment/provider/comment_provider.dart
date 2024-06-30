import 'package:firebase_database/firebase_database.dart';
import 'package:unimanga_app/app/constants/app_strings_firebase.dart';

import '../../../models/chap_comic.dart';

class CommentProvider {
  Future<List<CommentChapComic>> getCommentChapById(String id, String idChuong) async {
  try {
    DatabaseReference comicRef = stringFirebase.databaseconnect.ref(stringFirebase.StringHost);
    DataSnapshot snapshot = (await comicRef.child('Truyen').child(id).child('ChuongTruyen').child(idChuong).child('BinhLuan').once()).snapshot;
    List<CommentChapComic> commentchaps = [];
    List<dynamic> values = snapshot.value as List<dynamic>;
    values.forEach((element) {
      commentchaps.add(CommentChapComic.fromJson(element as Map<Object?, Object?>));
      
    });
    return commentchaps;
  } catch (e) {
    return [];
  }
    
}
}