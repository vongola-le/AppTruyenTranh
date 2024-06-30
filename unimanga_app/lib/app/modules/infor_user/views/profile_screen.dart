import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimanga_app/app/global_widgets/filter.dart';
import 'package:unimanga_app/app/modules/infor_user/views/component/my_profile.dart';
import 'package:unimanga_app/app/modules/list_comic/views/ListManga.dart';
import '../../../constants/app_function.dart';
import '../../list_comic/views/list_filter.dart';
import '../../signin/views/signin.dart';
import '../controller/user_controller.dart';
import 'component/profile_menu.dart';
import 'component/profile_pic.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //Hàm đăng xuất
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Login_Screen(),
      ),
    );
  }

  double sizefix(double size, double screen) {
    return Sizefix.sizefix(size, screen);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            IntroWidgetWithoutLogos(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: "assets/images/icons/user_icon.svg",
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyProfile(),
                  ),
                )
              },
            ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/images/icons/bell.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Filter(),
                  ),
                );
              },
            ),
            ProfileMenu(
              text: "Settings",
              icon: "assets/images/icons/settings.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "assets/images/icons/question_mark.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/images/icons/log_out.svg",
              press: () {
                logout(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
