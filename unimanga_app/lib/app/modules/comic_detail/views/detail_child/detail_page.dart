import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:unimanga_app/app/constants/index.dart';
import 'package:unimanga_app/app/global_widgets/comic_items.dart';
import 'package:unimanga_app/app/global_widgets/index.dart';
import 'package:unimanga_app/app/modules/category/bindings/category_binding.dart';
import 'package:unimanga_app/app/modules/category/controllers/dashboard_controllers.dart';
import 'package:unimanga_app/app/modules/category/views/category_comic.dart';


double sizefix( double size , double screen){
   return Sizefix.sizefix(size, screen);
}

class CategoryComic  extends StatelessWidget {
  const CategoryComic ({super.key, required this.screenHeight,required this.screenWidth});
  // ignore: prefer_typing_uninitialized_variables
  final screenWidth;
  final screenHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: sizefix(10, screenWidth), right: sizefix(10, screenWidth)),
      height: sizefix(22, screenHeight),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(sizefix(4, screenWidth)),
        border: Border.all( color: AppColors.RedPrimary, width: sizefix(1, screenWidth))
      ),
      child: TextCustom(text: "Manga", color: AppColors.RedPrimary, fontsize: sizefix(12, screenWidth),),
    );
  }
}
class DetailPage extends GetView{
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    DashBoardBinding().dependencies();
    CategoryController categoryController = Get.find<CategoryController>();
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: sizefix(20, screenHeight), left:sizefix(15, screenHeight), right: sizefix(15, screenHeight) ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Obx(() {
              var listcate = categoryController.listCatorogy.value;
              return Row(
                children: [
                  for(int i = 0; i < listcate.length; i++)
                    CategoryComicItem(screenHeight: screenHeight, screenWidth: screenWidth, cate: listcate[i])
                ],
              );
            }),
            SizedBox(height:sizefix(20, screenHeight),),
            Row(
              children: [
                Icon(Icons.person_2_rounded, color: AppColors.RedPrimary, size: sizefix(20, screenWidth),),
                SizedBox(width: sizefix(5, screenWidth),),
                TextCustom(text: "Tác giả              ", fontsize: sizefix(12, screenWidth),),
                TextCustom(text: "Trần Long Giang", fontsize: sizefix(12, screenWidth),),
              ],
            ),
            SizedBox(height: sizefix(5, screenHeight),),
            Row(
              children: [
                Icon(Icons.wifi, color: AppColors.RedPrimary, size: sizefix(20, screenWidth),),
                SizedBox(width: sizefix(5, screenWidth),),
                TextCustom(text: "Tình trạng        ", fontsize: sizefix(12, screenWidth),),
                TextCustom(text: "Đang cập nhật", fontsize: sizefix(12, screenWidth),),
              ],
            ),
            SizedBox(height: sizefix(10, screenHeight),),
            TextCustom(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc at pellentesque elemen , risus justo cursus ante, a aliquet turpis ante sed arcu. Nulla facilisi. Donec ac semper magna.", fontsize: sizefix(12, screenWidth),),
            SizedBox(height: sizefix(15, screenHeight),),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: sizefix(5, screenWidth), right: sizefix(5, screenWidth)) ,
                  height: sizefix(25, screenHeight),
                  width: sizefix(80, screenWidth),
                  decoration: BoxDecoration(
                    color: AppColors.pinkRed,
                    borderRadius: BorderRadius.circular(sizefix(3, screenHeight))    
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(MdiIcons.heart, color: AppColors.lightWhite,size: sizefix(12, screenWidth),),
                      SizedBox(width: sizefix(2, screenWidth),),
                      TextCustom(text: "Theo dõi", fontsize: sizefix(10, screenWidth),color: AppColors.lightWhite,)
                    ],             
                  ),
                ),
                SizedBox(width: sizefix(10, screenWidth),),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: sizefix(5, screenWidth), right: sizefix(5, screenWidth)) ,
                  height: sizefix(25, screenHeight),
                  width: sizefix(80, screenWidth),
                  decoration: BoxDecoration(
                    color: AppColors.violet,
                    borderRadius: BorderRadius.circular(sizefix(3, screenHeight))    
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(MdiIcons.handHeart , color: AppColors.lightWhite,size: sizefix(12, screenWidth),),
                      SizedBox(width: sizefix(2, screenWidth),),
                      TextCustom(text: "Thích", fontsize: sizefix(10, screenWidth),color: AppColors.lightWhite,)
                    ],             
                  ),
                )
              ],
            ),
            SizedBox(height: sizefix(20, screenHeight),),
            Center(
              child: Container(
                alignment: Alignment.center,
                height: sizefix(35, screenHeight),
                width: sizefix(200, screenWidth),
                decoration: BoxDecoration(
                  color: AppColors.RedPrimary,
                  borderRadius: BorderRadius.circular(sizefix(10, screenHeight))
                ),
                child: TextCustom(text: "Bắt đầu đọc", color: AppColors.lightWhite, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: sizefix(20, screenHeight),),
            Row(
              children: [
                TextCustom(text: "Bình luận", color: AppColors.RedPrimary,)
              ],
            )
          ],
        ),
      ),
    );
  }
}