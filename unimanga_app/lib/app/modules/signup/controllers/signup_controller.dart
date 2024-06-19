import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:unimanga_app/app/modules/signin/views/signin.dart';
import 'package:unimanga_app/app/modules/signup/provider/signup_provider.dart';
import '../../../models/user.dart';
import '../../home/views/home_views.dart';
import '../provider/signup_failer.dart';
import '../repository/signup_repository.dart';
import '../views/SignUp.dart';

class SignupController extends GetxController {
  // static SignupController get instance => Get.find();
  final SignupRepository authRepo;
  SignupController({required this.authRepo});

  Future<void> createUser(Users user) async {
    await authRepo.createUser(user);
  }

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
        ? Get.to(() => const Login_Screen())
        : Get.to(() => const HomeView());
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
