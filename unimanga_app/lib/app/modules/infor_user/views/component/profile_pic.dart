import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/app_images.dart';
import '../../../../global_widgets/appbar_custom2.dart';
import '../../controller/user_controller.dart';
import '../../repository/user_repository.dart';

Widget IntroWidgetWithoutLogos() {
  UserRepository userRepository = Get.put(UserRepository());
  return Column(
    children: [
      Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        children: [
          IntroWidgetWithoutLogo(),
          FutureBuilder<Map<String, dynamic>>(
            future: userRepository.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Đã xảy ra lỗi: ${snapshot.error}'),
                );
              }

              Map<String, dynamic>?  userData = snapshot.data;

              if (userData == null || userData.isEmpty) {
                return Center(
                  child: Text(''),
                );
              }
              return Padding(
                padding: EdgeInsets.only(top: 190.0),
                child: ListTile(
                  leading: CircleAvatar(
                    child: ClipOval(
                      child: Image(
                        image: NetworkImage(userData['imageUrl']),
                        fit: BoxFit.cover,
                        width: 60.0,
                        height: 60.0,
                      ),
                    ),
                    radius: 30.0,
                  ),
                  title: Text(
                    "${userData['name']}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  subtitle: Text(
                    "Luyện khí tầng 7",
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
