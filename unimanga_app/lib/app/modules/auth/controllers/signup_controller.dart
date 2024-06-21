import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:unimanga_app/app/modules/list_comic/views/ListManga.dart';
import 'package:unimanga_app/app/modules/signin/views/signin.dart';
import 'package:unimanga_app/app/modules/update_pass/views/VerifiedScreen.dart';
import '../../../models/user.dart';
import '../../home/views/home_views.dart';
import '../../signup/provider/signup_failer.dart';
import '../../signup/views/SignUp.dart';

class Auth_Controller extends GetxController {
  static Auth_Controller get instance => Get.find();
  final _auth = FirebaseAuth.instance;

  late Rx<User?> firebaseUser = Rx<User?>(null);
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const ForgotPassword())
        : Get.offAll(() => const HomeView());
  }

  loginAccount(Users user) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password.toString(),
      );
    } on FirebaseAuthException catch (e) {
      final ex = SignUp_AccountFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw SignUp_AccountFailure(ex.message);
    } catch (_) {}
  }
}
