
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:unimanga_app/app/global_widgets/index.dart';
import 'package:unimanga_app/app/modules/infor_user/bindings/info_user_bindings.dart';
import '../controllers/info_user_controllers.dart'; 
class InfoScreen extends GetView<InforUserController>{
  const InfoScreen({super.key,});
  @override
  Widget build(BuildContext context) {
    InforUserbinding().dependencies();
    return Scaffold(
      appBar: AppBar(title: Text('User Information')),
      body: Obx(() {
        final user = controller.user.value;
        if (user == null) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${user.name ?? ''}'),
                Text('Email: ${user.email}'),
                Text('Score: ${user.score?.toString() ?? ''}'),
                Center(
                  child: GestureDetector(
                    onTap: () => controller.logout(),
                    child: TextCustom(text: "Dang xuat")
                  ),
                )
              ],
            ),
          );
        }
      }),
    );
  }

}