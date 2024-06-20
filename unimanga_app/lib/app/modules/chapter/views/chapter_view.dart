import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:unimanga_app/app/constants/index.dart';
import 'package:unimanga_app/app/global_widgets/chappter_item.dart';
import 'package:unimanga_app/app/global_widgets/index.dart';
import 'package:unimanga_app/app/models/chap_comic.dart';
import 'package:unimanga_app/app/models/comic_model.dart';
import 'package:unimanga_app/app/modules/chapter/bindings/chapter_binding.dart';
import 'package:unimanga_app/app/modules/chapter/controllers/chapter_controllers.dart';
import 'package:unimanga_app/app/modules/comment/views/comment_chapter_views.dart';
import '../../../global_widgets/image_chapter.dart';
import '../../dashboard/controllers/dashboard_controllers.dart';

double sizefix( double size , double screen){
   return Sizefix.sizefix(size, screen);
}

class ChapterView extends GetView<ChapterController> {
  
   ChapterView({required this.screenHeight, required this.screenWidth, required this.chapComicModel , this.comic});
  // ignore: prefer_typing_uninitialized_variables
  final screenWidth;
  // ignore: prefer_typing_uninitialized_variables
  final screenHeight;
  final ChapComicModel chapComicModel;
  ComicModel? comic;

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.find<DashboardController>();
    ChapterBinding().dependencies();
    List<ChapComicModel>? listchap = comic?.chapComicModel!;
    int currentIndex = listchap!.indexOf(chapComicModel);
    bool isLastChapter = currentIndex == listchap.length - 1;
    bool isFirstChapter = currentIndex == 0;
    List<ImageChap> listImageChap = chapComicModel.imageChap!;
    bool hasData = listImageChap.isNotEmpty;
    return GestureDetector(
      onDoubleTap: () => controller.toggleContainerVisibility(),
      child: Scaffold(
        backgroundColor: AppColors.lightWhite,
        body:  RefreshIndicator (
          onRefresh: () => dashboardController.fetchImageChap(comic!.id!, chapComicModel.id!),
          child: Stack(
            children: [
              // Phần nội dung chiếm toàn bộ màn hình
              Container(
               alignment: Alignment.bottomCenter,
                height: screenHeight,
                width: screenWidth,
                decoration: BoxDecoration(
                  color: AppColors.lightWhite
                ),
                child: hasData
                ? GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 0.67,
                    ),
                    // ignore: invalid_use_of_protected_member
                    itemCount: dashboardController.listchap.value.length,
                    itemBuilder: (context, index) {
                      return Obx(() {
                        
                        // Hiển thị hình ảnh tương ứng với imageChap
                        return ImageChapItem(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          // ignore: invalid_use_of_protected_member
                          imageChap: dashboardController.listchap.value[index],
                        );
                      });
                    },
                  ): Center( child: TextCustom(text: "Dữ liệu đang update"),)
              ),

              // Phần top chồng lên phần nội dung
              Positioned(
                top: 0,
                child: Obx(() => controller.isContainerVisible.value ? 
                Container(
                  alignment: Alignment.center,
                  width: screenWidth,
                  height: sizefix(60, screenHeight),
                  decoration: BoxDecoration(
                    color: AppColors.lightWhite,
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(top: sizefix(10, screenHeight), left: sizefix(10, screenHeight), right: sizefix(10, screenHeight)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
                          },
                          child: Icon(Icons.arrow_back_ios, size: sizefix(15, screenHeight)),
                        ),
                        Padding(
                          padding:EdgeInsets.only(left: sizefix(10, screenHeight)),
                          child:  TextCustom(text: "${chapComicModel.tenChuong}", fontsize: sizefix(15, screenHeight))
                        )
                      ],
                    ),
                  )
                ) 
                : const Text("")), 
              ),
              // Phần bottom chồng lên phần nội dung
              Positioned(
                bottom: 0,
                child: Obx(() => controller.isContainerVisible.value ? 
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: sizefix(10, screenWidth), right: sizefix(10, screenWidth), top: sizefix(20, screenHeight)),
                  width: screenWidth,
                  height: sizefix(60, screenHeight),
                  decoration: BoxDecoration(
                    color: AppColors.lightWhite,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: sizefix(500, screenHeight),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(left: sizefix(15, screenWidth),right: sizefix(15, screenWidth),top: sizefix(15, screenWidth)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextCustom(text: "${comic!.chapComicModel!.length} chương",fontsize: sizefix(15, screenWidth),),
                                          Row(
                                            children: [
                                              TextCustom(text: "Cũ nhất", fontsize: sizefix(12, screenWidth),),
                                              Padding(
                                                padding:  EdgeInsets.only(left: sizefix(10, screenWidth)),
                                                child: TextCustom(text: "Mới nhất",fontsize: sizefix(12, screenWidth),),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(top: sizefix(20, screenHeight)),
                                        child: RefreshIndicator(
                                          onRefresh: fetchItems,
                                          child: GridView.builder(
                                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 1, // Số lượng cột
                                              childAspectRatio: 6, // Tỉ lệ chiều rộng và chiều cao của mỗi item
                                            ),
                                            itemCount: listchap?.length,
                                            itemBuilder: (context, index) {
                                              return ChappterItem(screenHeight: screenHeight, screenWidth: screenWidth, chappter: listchap![index], comic: comic,);
                                            },
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              );
                            },
                          );
                        },
                        child: Column(
                          children: [
                            Icon(Icons.format_list_bulleted, size: sizefix(20, screenWidth),),
                            TextCustom(text: "Chương", fontsize: sizefix(8, screenWidth),)
                          ],
                        ),
                      ),
                      GestureDetector(
          
                        child: Column(
                          children: [
                            Icon(Icons.restart_alt_outlined, size: sizefix(20, screenWidth),),
                            TextCustom(text: "Tải lại",fontsize: sizefix(8, screenWidth),)
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => 
                            CommentChapComicView()
                          ),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.comment_outlined, size: sizefix(20, screenWidth),),
                            TextCustom(text: "Bình luận",fontsize: sizefix(8, screenWidth),)
                          ],
                        ),
                      ),
                     GestureDetector(
                      onTap: () async {
                        if (currentIndex > 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChapterView(
                                screenHeight: screenHeight,
                                screenWidth: screenWidth,
                                chapComicModel:listchap[currentIndex - 1],
                                comic: comic,
                              ),
                            ),
                            
                          );
                           dashboardController.listchap.value = listchap[currentIndex - 1].imageChap!;
                        }
                      },
                      child: Column(
                        children: [
                          isFirstChapter ?  Icon(Icons.navigate_before_sharp, size: sizefix(20, screenWidth), color: Colors.grey,)
                          : Icon(Icons.navigate_before_sharp, size: sizefix(20, screenWidth)),
                          isFirstChapter ? TextCustom(text: "Chương trước", fontsize: sizefix(8, screenWidth), color: Colors.grey,)
                          : TextCustom(text: "Chương trước", fontsize: sizefix(8, screenWidth))
                        ],
                      ),
                     ),
                     GestureDetector(
                      onTap: () async {
                        if (currentIndex < listchap.length - 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChapterView(
                                screenHeight: screenHeight,
                                screenWidth: screenWidth,
                                chapComicModel:listchap[currentIndex + 1],
                                comic: comic,
                              ),
                            ),
                            
                          );
                           dashboardController.listchap.value = listchap[currentIndex + 1].imageChap!;
                        }
                      },
                      child: Column(
                        children: [
                          isLastChapter ?  Icon(Icons.navigate_next_sharp, size: sizefix(20, screenWidth), color: Colors.grey,)
                          : Icon(Icons.navigate_next_sharp, size: sizefix(20, screenWidth)),
                          isLastChapter ? TextCustom(text: "Chương sau", fontsize: sizefix(8, screenWidth), color: Colors.grey,)
                          : TextCustom(text: "Chương sau", fontsize: sizefix(8, screenWidth))
                        ],
                      ),
                     )
                    ],
                  ),
                ) 
                : const Text("")), 
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}
Future<void> fetchItems() async {
    // final reponse = await itemapi.fetchData();
    // setState(() {
    //   itemApis = reponse;
    // });
  }