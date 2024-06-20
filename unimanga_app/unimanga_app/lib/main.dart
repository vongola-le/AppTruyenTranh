import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:unimanga_app/app/constants/app_fonts.dart';
import 'package:unimanga_app/app/modules/comic_detail/views/comic_detail.dart';
import 'package:unimanga_app/app/modules/comic_detail/views/detail_child/detail_page.dart';
import 'package:unimanga_app/app/modules/home/views/home_views.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.blue, fontFamily: AppFonts.verLag),
      home: const HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}