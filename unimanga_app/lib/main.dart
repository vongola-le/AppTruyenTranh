import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:unimanga_app/app/constants/app_fonts.dart';
import 'package:get/get.dart';
import 'package:unimanga_app/app/modules/auth/bindings/auth_bindings.dart';
import 'package:unimanga_app/app/modules/home/views/home_views.dart';
import 'package:unimanga_app/app/modules/signup/bindings/signup_bindings.dart';
import 'package:unimanga_app/app/modules/signup/controllers/signup_controller.dart';
import 'package:unimanga_app/app/modules/signup/repository/signup_repository.dart';
import 'package:unimanga_app/app/modules/signup/views/SignUp.dart';
import 'app/modules/signin/views/signin.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AuthBindings authBindings = AuthBindings();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => authBindings.dependencies());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.blue, fontFamily: AppFonts.verLag),
      home: SignUp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
