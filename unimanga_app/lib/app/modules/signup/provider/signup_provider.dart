import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../models/user.dart';
import 'signup_failer.dart';


// class SignupProvider extends GetxController {
//   static SignupProvider get instance => Get.find();
//   final _auth = FirebaseAuth.instance;
//   final _db = FirebaseFirestore.instance;
//   // Tạo user
//   createUser(Users user) async {
//     try {
//       await _auth
//           .createUserWithEmailAndPassword(
//               email: user.email, password: user.password.toString())
//           .then((value) => postDetailsToFirestore(user));
//     } on FirebaseAuthException catch (e) {
//       final ex = SignUp_AccountFailure.code(e.code);
//       print('FIREBASE AUTH EXCEPTION - ${ex.message}');
//       throw ex;
//     } catch (_) {}
//   }

//   // Lưu trữ vào firestore
//   postDetailsToFirestore(Users user) async {
//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//     var _user = _auth.currentUser;
//     CollectionReference usersRef = firebaseFirestore.collection('Users');

//    Map<String, dynamic> userData = {
//   'id': user.id,
//   'imageUrl': user.imageUrl,
//   'name': user.name,
//   'email': user.email,
//   'password': user.password,
//   'score': user.score,
// };

//     await usersRef.doc(_user!.uid).set(userData);
//   }

//   // lấy 1 user
//   Future<Users> getUserDetails(String email) async {
//     final snapshot =
//         await _db.collection('Users').where('Email', isEqualTo: email).get();
//     final userData = snapshot.docs.map((e) => Users.fromSnapshot(e)).single;
//     return userData;
//   }

//   // lấy tất cả
//   Future<Users> allUser() async {
//     final snapshot = await _db.collection('Users').get();
//     final userData = snapshot.docs.map((e) => Users.fromSnapshot(e)).single;
//     return userData;
//   }
// }
class SignupProvider {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
  // Tạo user
  createUser(Users user) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: user.email, password: user.password.toString())
          .then((value) => postDetailsToFirestore(user));
    } on FirebaseAuthException catch (e) {
      final ex = SignUp_AccountFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {}
  }

  // Lưu trữ vào firestore
  postDetailsToFirestore(Users user) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var _user = _auth.currentUser;
    CollectionReference usersRef = firebaseFirestore.collection('Users');

   Map<String, dynamic> userData = {
  'id': user.id,
  'imageUrl': user.imageUrl,
  'name': user.name,
  'email': user.email,
  'password': user.password,
  'score': user.score,
};

    await usersRef.doc(_user!.uid).set(userData);
  }

  // lấy 1 user
  Future<Users> getUserDetails(String email) async {
    final snapshot =
        await _db.collection('Users').where('Email', isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => Users.fromSnapshot(e)).single;
    return userData;
  }

  // lấy tất cả
  Future<Users> allUser() async {
    final snapshot = await _db.collection('Users').get();
    final userData = snapshot.docs.map((e) => Users.fromSnapshot(e)).single;
    return userData;
  }
}
