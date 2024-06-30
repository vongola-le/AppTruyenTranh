import 'package:firebase_database/firebase_database.dart';
import 'package:unimanga_app/app/constants/app_strings_firebase.dart';

class BookCaseProvider {
 Future<void> addComicIntoComicSave(
      String uiduser, String comicName, String comicId) async {
    try {
      DatabaseReference accountRef = stringFirebase.databaseconnect.ref(stringFirebase.StringHost);
      DatabaseReference userRef = accountRef.child('TaiKhoan').child(uiduser).child("TruyenDaLuu");

      //DataSnapshot snapshot = await userRef.child(comicId).get();
        await userRef.child(comicId).set({
          "TenTruyen": comicName,
          "IdTruyen": comicId,
        });
      print("Chapter  comic $comicId added successfully.");
    } catch (e) {
      print("Error adding chapter to comic: $e");
    }
  }
  Future<bool> isComicExists(String uiduser, String comicId) async {
    try {
      DatabaseReference accountRef = stringFirebase.databaseconnect.ref(stringFirebase.StringHost);
      DatabaseReference userRef = accountRef.child('TaiKhoan').child(uiduser).child("TruyenDaLuu");

      DataSnapshot snapshot = await userRef.child(comicId).get();

      return snapshot.exists;
    } catch (e) {
      print("Error checking if comic exists: $e");
      return false;
    }
  }
  Future<void> removeComicFromSaved(String uiduser, String comicId, String s) async {
    try {
      DatabaseReference accountRef =
          stringFirebase.databaseconnect.ref(stringFirebase.StringHost);
      DatabaseReference userRef =
          accountRef.child('TaiKhoan').child(uiduser).child("TruyenDaLuu");

      await userRef.child(comicId).remove();
      print("Comic $comicId removed successfully.");
    } catch (e) {
      print("Error removing comic from saved: $e");
    }
  }

}