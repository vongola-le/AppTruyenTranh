import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:unimanga_app/app/constants/app_fonts.dart';
import 'package:get/get.dart';
import 'package:unimanga_app/app/modules/auth/controllers/signup_controller.dart';
import 'package:unimanga_app/app/modules/signup/views/SignUp.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(Auth_Controller()));

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
