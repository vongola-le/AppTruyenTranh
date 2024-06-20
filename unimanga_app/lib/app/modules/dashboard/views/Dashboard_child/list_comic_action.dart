import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimanga_app/app/global_widgets/text_custom.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_images.dart';
import '../../../../global_widgets/comic_items.dart';
import '../../bindings/dashboard_bindings.dart';
import '../../controllers/dashboard_controllers.dart';

class ListComicActionView extends GetView {
  const ListComicActionView({super.key, required this.screenHeight, required this.screenWidth});
  final double screenWidth;
  final double screenHeight;
  @override
  Widget build(BuildContext context){
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: sizefix(22, screenHeight),
              width: sizefix(22, screenHeight),
              child: Image.asset(AppImages.icAction),
            ),
            SizedBox(width: sizefix(5, screenWidth),),
            TextCustom(
              text: "Truyện hành động",
              fontWeight: FontWeight.bold,
              color: AppColors.black,
              fontsize: sizefix(15, screenWidth),
            ),
          ],
        ),
        SizedBox(height: sizefix(15, screenHeight)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ListComicAction(),
        ),
      ],
    );
  }
}

class ListComicAction extends GetView<DashboardController>{
  @override
  Widget build(BuildContext context){
    DashBoardBindings().dependencies();
    return Obx(() {
      var listComicAction = controller.listcomicAction.value;
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for(int i = 0; i< listComicAction.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: ComicItems(comic: listComicAction[i],),
            )
        ],
      );
    });
  }
}