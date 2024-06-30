import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimanga_app/app/constants/index.dart';
import 'package:unimanga_app/app/models/chap_comic.dart';
import 'package:unimanga_app/app/models/comic_model.dart';
import 'package:unimanga_app/app/modules/chapter/bindings/chapter_binding.dart';
import 'package:unimanga_app/app/modules/chapter/controllers/chapter_controllers.dart';
import 'package:unimanga_app/app/modules/chapter/views/chapter_view_child/chapter_bottom.dart';
import 'package:unimanga_app/app/modules/chapter/views/chapter_view_child/chapter_content.dart';
import 'package:unimanga_app/app/modules/chapter/views/chapter_view_child/chapter_defautl.dart';
import 'package:unimanga_app/app/modules/chapter/views/chapter_view_child/chapter_top.dart';
import '../../comment/bindings/comment_binding.dart';
import '../../dashboard/controllers/dashboard_controllers.dart';
import '../../infor_user/bindings/info_user_bindings.dart';
import '../provider/chapter_provider.dart';

double sizefix( double size , double screen){
   return Sizefix.sizefix(size, screen);
}

// ignore: must_be_immutable
class ChapterView extends GetView<ChapterController> {
  
  ChapterView({required this.screenHeight, required this.screenWidth, required this.chapComicModel, this.comic});

  final double screenWidth;
  final double screenHeight;
  final ChapComicModel chapComicModel;
  ComicModel? comic;

  @override
  Widget build(BuildContext context) {
    CommentBindings().dependencies();
    ChapterBinding().dependencies();
    InforUserbinding().dependencies();

    final dashboardController = Get.find<DashboardController>();
    final chapterProvider = ChapterProvider();
    int loaiChuong = int.tryParse(chapComicModel.loaiChuong.toString()) ?? 0;
    User? firebaseUser = FirebaseAuth.instance.currentUser;

    if (firebaseUser == null) {
      return GestureDetector(
        onDoubleTap: () => controller.toggleContainerVisibility(),
        child: Scaffold(
          backgroundColor: AppColors.lightWhite,
          body: RefreshIndicator(
                onRefresh: () => dashboardController.fetchImageChap(comic!.id!, chapComicModel.id!),
                child: Stack(
                  children: [
                    // Phần nội dung chiếm toàn bộ màn hình                  
                    ChappterCoin(screenHeight: screenHeight, screenWidth: screenWidth, chapComicModel: chapComicModel, comic: comic),                  
                    // Phần top chồng lên phần nội dung
                    Positioned(
                      top: 0,
                      child: Obx(() => AnimatedOpacity(
                        opacity: controller.isContainerVisible.value ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 1000),
                        child: ChappterTop(screenHeight: screenHeight, screenWidth: screenWidth, chapComicModel: chapComicModel, comic: comic),
                      )),
                    ),                    
                    // Phần bottom chồng lên phần nội dung
                    Positioned(
                      bottom: 0,
                      child: Obx(() => AnimatedOpacity(
                        opacity: controller.isContainerVisible.value ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 1000),
                        child: ChappterBottom(screenHeight: screenHeight, screenWidth: screenWidth, chapComicModel: chapComicModel, comic: comic),
                      )),
                    ),
                  ],
                ),
              ),
          ),
      );
    }
    return FutureBuilder<bool>(
      future: chapterProvider.isChapterUnlocked(firebaseUser.uid, comic!.id!, chapComicModel.id!),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else {
          bool isUnlocked = snapshot.data ?? false;
          return GestureDetector(
            onDoubleTap: () => controller.toggleContainerVisibility(),
            child: Scaffold(
              backgroundColor: AppColors.lightWhite,
              body: RefreshIndicator(
                onRefresh: () => dashboardController.fetchImageChap(comic!.id!, chapComicModel.id!),
                child: Stack(
                  children: [
                    // Phần nội dung chiếm toàn bộ màn hình
                    (loaiChuong == 1 && !isUnlocked)
                        ? ChappterCoin(screenHeight: screenHeight, screenWidth: screenWidth, chapComicModel: chapComicModel, comic: comic)
                        : ChapterDefault(screenHeight: screenHeight, screenWidth: screenWidth, chapComicModel: chapComicModel, comic: comic),
                    
                    // Phần top chồng lên phần nội dung
                    Positioned(
                      top: 0,
                      child: Obx(() => AnimatedOpacity(
                        opacity: controller.isContainerVisible.value ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 1000),
                        child: ChappterTop(screenHeight: screenHeight, screenWidth: screenWidth, chapComicModel: chapComicModel, comic: comic),
                      )),
                    ),
                    
                    // Phần bottom chồng lên phần nội dung
                    Positioned(
                      bottom: 0,
                      child: Obx(() => AnimatedOpacity(
                        opacity: controller.isContainerVisible.value ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 1000),
                        child: ChappterBottom(screenHeight: screenHeight, screenWidth: screenWidth, chapComicModel: chapComicModel, comic: comic),
                      )),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

