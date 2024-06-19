import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import '../../../models/user.dart';
import '../provider/signin_provider.dart';
import '../repository/signin_repository.dart';



class LoginController extends GetxController {
  LoginController({required this.provider});
  final SigninRepository  provider;

  Future<void> loginAccount(Users user) async {
    await provider.loginUser(user);
  }
}
