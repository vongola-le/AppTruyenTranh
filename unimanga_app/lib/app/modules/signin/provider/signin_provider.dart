import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../models/user.dart';
import '../../signup/provider/signup_failer.dart';


class SigninProvider{
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

   loginAccount(Users user) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: user.email.toString(),
        password: user.password.toString(),
      );
    } on FirebaseAuthException catch (e) {
      final ex = SignUp_AccountFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw SignUp_AccountFailure(ex.message);
    } catch (_) {}
  }

 
}
