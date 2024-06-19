import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimanga_app/app/models/user.dart';
import 'package:unimanga_app/app/modules/home/views/home_views.dart';

import '../../signup/provider/signup_provider.dart';
import '../provider/signin_provider.dart';

// class Auth_Resposity extends GetxController {
//   final _auth = FirebaseAuth.instance;

//   loginAccount(Users user) async {
//     try {
//       await _auth.signInWithEmailAndPassword(
//         email: user.email.toString(),
//         password: user.password.toString(),
//       );
//     } on FirebaseAuthException catch (e) {
//       final ex = SignUp_AccountFailure.code(e.code);
//       print('FIREBASE AUTH EXCEPTION - ${ex.message}');
//       throw SignUp_AccountFailure(ex.message);
//     } catch (_) {}
//   }
// }

class SigninRepository{
  SigninRepository({required this.signinReponsitory});
  final SigninProvider signinReponsitory;

   Future<void> loginUser(Users user) async {
    await signinReponsitory.loginAccount(user);
  }
}
