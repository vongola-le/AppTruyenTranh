import 'package:get/get.dart';
import 'package:unimanga_app/app/modules/auth/controllers/signup_controller.dart';
import 'package:unimanga_app/app/modules/category/controllers/dashboard_controllers.dart';
import 'package:unimanga_app/app/modules/signup/controllers/signup_controller.dart';
import 'package:unimanga_app/app/modules/signup/provider/signup_provider.dart';
import 'package:unimanga_app/app/modules/signup/repository/signup_repository.dart';
import '../../signin/controllers/signin_controller.dart';
import '../../signin/provider/signin_provider.dart';
import '../../signin/repository/signin_repository.dart';

class AuthBindings implements Bindings {
  @override
  Future<void> dependencies() async {
    // Login
    Get.lazyPut(() => SigninProvider());
    Get.lazyPut(() => SigninRepository(signinReponsitory: Get.find<SigninProvider>()));
    Get.put(LoginController(provider: Get.find<SigninRepository>()));

    //SignUp
    Get.lazyPut(() => SignupProvider());
    Get.lazyPut(() => SignupRepository(signupReponsitory: Get.find<SignupProvider>()));
    Get.put(SignupController(authRepo: Get.find<SignupRepository>()));

    // Authention
    Get.put(()=> Get.find<Auth_Controller>());
  }
}