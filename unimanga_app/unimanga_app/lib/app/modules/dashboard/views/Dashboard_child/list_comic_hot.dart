import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimanga_app/app/global_widgets/text_custom.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_images.dart';
import '../../../../global_widgets/comic_items.dart';
import '../../bindings/dashboard_bindings.dart';
import '../../controllers/dashboard_controllers.dart';

class ListComicHotView extends GetView {
  const ListComicHotView({super.key, required this.screenHeight, required this.screenWidth});
  final double screenWidth;
  final double screenHeight;
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: sizefix(22, screenHeight),
                  width: sizefix(22, screenHeight),
                  child: Image.asset(AppImages.icLogohot),
                ),
                TextCustom(
                  text: "Truyện đề cử",
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                  fontsize: sizefix(15, screenWidth),
                ),
              ],
            ),
            SizedBox(
                  height: sizefix(22, screenHeight),
                  width: sizefix(22, screenHeight),
                  child: Icon(Icons.navigate_next, color: AppColors.RedPrimary,),
                ),
          ],
        ),
        SizedBox(height: sizefix(15, screenHeight)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ListComicHot(),
        ),
      ],
    );
  }
}

class ListComicHot extends GetView<DashboardController>{
  @override
  Widget build(BuildContext context){
    DashBoardBindings().dependencies();
    return Obx(() {
      var listComicHot = controller.listcomic.value;
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for(int i = 0; i< listComicHot.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 0),
              child: ComicItems(comic: listComicHot[i],),
            )
        ],
      );
    });
  }
}