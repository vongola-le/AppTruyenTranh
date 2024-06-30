import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:unimanga_app/app/modules/infor_user/provider/info_user_provider.dart';
import '../../../models/user.dart';
import '../../infor_user/bindings/info_user_bindings.dart';
import '../../infor_user/repository/info_user_repository.dart';
import '../../signup/provider/signup_failer.dart';


class SigninProvider extends GetxController {
  final _auth = FirebaseAuth.instance;
  var user = Rxn<Users>();

  Future<void> loginAccount(Users user) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password.toString(),
      );

     
      Users? fetchedUser = await InforUserProvider().getUserByUid(userCredential.user!.uid);
      if (fetchedUser != null) {
        this.user.value = fetchedUser;
      }
    } on FirebaseAuthException catch (e) {
      final ex = SignUp_AccountFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw SignUp_AccountFailure(ex.message);
    } catch (_) {
      throw Exception("An error occurred while logging in.");
    }
  }
}
