import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:unimanga_app/app/constants/index.dart';
import 'package:unimanga_app/app/global_widgets/comic_items.dart';
import 'package:unimanga_app/app/global_widgets/index.dart';
import 'package:unimanga_app/app/models/category_comic_model.dart';
import 'package:unimanga_app/app/models/comic_model.dart';
import 'package:unimanga_app/app/modules/book_case/bindings/book_case_bindings.dart';
import 'package:unimanga_app/app/modules/book_case/provider/book_case_provider.dart';
import 'package:unimanga_app/app/modules/category/views/category_comic.dart';


double sizefix( double size , double screen){
   return Sizefix.sizefix(size, screen);
}

class DetailPage extends GetView{
  const DetailPage({super.key, required this.comics});
  final ComicModel comics;
  @override
  Widget build(BuildContext context) {
    BookCaseBinding().dependencies();
    final comicCase = Get.find<BookCaseProvider>();
    List<categoryComicModel> listcate = comics.theLoai!;
    User? firebaseUser = FirebaseAuth.instance.currentUser;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
     RxBool isSaved = false.obs;

    // Hàm để kiểm tra và cập nhật trạng thái isSaved
    void checkSavedStatus() async {
      bool exists = await comicCase.isComicExists(firebaseUser!.uid, comics.id!);
      isSaved.value = exists; // Cập nhật giá trị isSaved
      print("Truyện lưu chưa: ${isSaved.value}");
    }

    // Gọi hàm kiểm tra khi widget được build
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      checkSavedStatus();
    });
    print("Truyện lưu chưa: $isSaved");
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: sizefix(20, screenHeight), left:sizefix(15, screenHeight), right: sizefix(15, screenHeight) ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [          
            Container(
              height: sizefix(30, screenHeight),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listcate.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.only(right: sizefix(5, screenWidth)),
                    child: CategoryComicItem(screenHeight: screenHeight, screenWidth: screenWidth, cate: listcate[index]),
                  );
                },
              ),
            ),
            SizedBox(height:sizefix(20, screenHeight),),
            Row(
              children: [
                Icon(Icons.menu_book_rounded, color: AppColors.RedPrimary, size: sizefix(20, screenWidth),),
                SizedBox(width: sizefix(5, screenWidth),),
                TextCustom(text: "Tên truyện       ", fontsize: sizefix(12, screenWidth),),
                TextCustom(text: comics.ten, fontsize: sizefix(12, screenWidth),),
              ],
            ),
            SizedBox(height:sizefix(5, screenHeight),),
            Row(
              children: [
                Icon(Icons.person_2_rounded, color: AppColors.RedPrimary, size: sizefix(20, screenWidth),),
                SizedBox(width: sizefix(5, screenWidth),),
                TextCustom(text: "Tác giả              ", fontsize: sizefix(12, screenWidth),),
                TextCustom(text: comics.tacGia, fontsize: sizefix(12, screenWidth),),
              ],
            ),
            SizedBox(height: sizefix(5, screenHeight),),
            Row(
              children: [
                Icon(Icons.wifi, color: AppColors.RedPrimary, size: sizefix(20, screenWidth),),
                SizedBox(width: sizefix(5, screenWidth),),
                TextCustom(text: "Tình trạng        ", fontsize: sizefix(12, screenWidth),),
                TextCustom(text: comics.tinhTrang, fontsize: sizefix(12, screenWidth),),
              ],
            ),
            SizedBox(height: sizefix(10, screenHeight),),
            TextCustom(text: comics.gioiThieu, fontsize: sizefix(12, screenWidth),),
            SizedBox(height: sizefix(15, screenHeight),),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: sizefix(5, screenWidth), right: sizefix(5, screenWidth)) ,
                  height: sizefix(25, screenHeight),
                  width: sizefix(90, screenWidth),
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
                  width: sizefix(90, screenWidth),
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
                ),
                SizedBox(width: sizefix(10, screenWidth),),
                 Obx(() {
              return GestureDetector(
                onTap: () {
                  if (isSaved.value) {
                    comicCase.removeComicFromSaved(firebaseUser!.uid, comics.id!, comics.ten!);
                    isSaved.value = false;
                    print("Remove from saved");
                    // Thực hiện hành động bỏ lưu
                  } else {
                    comicCase.addComicIntoComicSave(firebaseUser!.uid, comics.ten!, comics.id!);
                    isSaved.value = true;
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: sizefix(5, screenWidth)),
                  height: sizefix(25, screenHeight),
                  width: sizefix(90, screenWidth),
                  decoration: BoxDecoration(
                    color: isSaved.value ? AppColors.red : AppColors.bluePrimary,
                    borderRadius: BorderRadius.circular(sizefix(3, screenHeight)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isSaved.value ? Icons.bookmark_remove : Icons.bookmark_add,
                        color: AppColors.lightWhite,
                        size: sizefix(12, screenWidth),
                      ),
                      SizedBox(width: sizefix(2, screenWidth)),
                      TextCustom(
                        text: isSaved.value ? "Bỏ lưu" : "Lưu",
                        fontsize: sizefix(10, screenWidth),
                        color: AppColors.lightWhite,
                      ),
                    ],
                  ),
                ),
              );
            })
              ],
            ),
          ],
        ),
      ),
    );
  }
}