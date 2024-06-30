import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimanga_app/app/models/user.dart';
import 'package:unimanga_app/app/modules/home/views/home_views.dart';

import '../../signup/provider/signup_failer.dart';
import '../../signup/provider/signup_provider.dart';
import '../provider/signin_provider.dart';

class SigninRepository extends GetxController {
  final _auth = FirebaseAuth.instance;

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

