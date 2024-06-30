import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:unimanga_app/app/modules/chapter/controllers/chapter_controllers.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_function.dart';
import '../../../../global_widgets/image_chapter.dart';
import '../../../../global_widgets/text_custom.dart';
import '../../../../models/chap_comic.dart';
import '../../../../models/comic_model.dart';
import '../../../dashboard/controllers/dashboard_controllers.dart';

double sizefix(double size, double screen) {
  return Sizefix.sizefix(size, screen);
}

// ignore: must_be_immutable
class ChapterDefault extends GetView<ChapterController> {
  ChapterDefault({
    required this.screenHeight,
    required this.screenWidth,
    required this.chapComicModel,
    this.comic,
  });

  final double screenWidth;
  final double screenHeight;
  final ChapComicModel chapComicModel;
  ComicModel? comic;

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.find<DashboardController>();
    List<ImageChap> listImageChap = chapComicModel.imageChap!;
    bool hasData = listImageChap.isNotEmpty;

    return Container(
      alignment: Alignment.bottomCenter,
      height: screenHeight,
      width: screenWidth,
      decoration: BoxDecoration(
        color: AppColors.lightWhite,
      ),
      child: hasData
          ? _buildImageGridView(dashboardController)
          : Center(child: TextCustom(text: "Dữ liệu đang update")),
    );
  }

  Widget _buildImageGridView(DashboardController dashboardController) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 0.67,
      ),
      // ignore: invalid_use_of_protected_member
      itemCount: dashboardController.listchap.value.length,
      itemBuilder: (context, index) {
        return Obx(() {
          return ImageChapItem(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            // ignore: invalid_use_of_protected_member
            imageChap: dashboardController.listchap.value[index],
          );
        });
      },
    );
  }
}
