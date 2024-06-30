import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: unnecessary_import
import 'package:unimanga_app/app/constants/app_function.dart';
import 'package:unimanga_app/app/constants/index.dart';
import 'package:unimanga_app/app/global_widgets/index.dart';
import '../../../global_widgets/comment_items.dart';
import '../../../models/chap_comic.dart';
import '../../../models/comic_model.dart';
import '../controllers/comment_controllers.dart';
import 'package:intl/intl.dart';

double sizefix( double size , double screen){
   return Sizefix.sizefix(size, screen);
}

// ignore: must_be_immutable
class CommentChapComicView extends GetView<CommentController>{
  CommentChapComicView({super.key, required this.chapComicModel, this.comic});
  final ChapComicModel chapComicModel;
  ComicModel? comic;
  @override
  Widget build (BuildContext context) {
    List<CommentChapComic> listComment = chapComicModel.comment!;
    final DateFormat dateFormat = DateFormat('dd/MM/yyyy h:mm a', 'vi');
    listComment.sort((a, b) {
      final dateTimeA = dateFormat.parse('${a.ngay} ${a.thoiGian}');
      final dateTimeB = dateFormat.parse('${b.ngay} ${b.thoiGian}');
      return dateTimeB.compareTo(dateTimeA);
    });
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          listComment.isEmpty
          ? Center(child: TextCustom(text: "Chưa có bình luận nào cả"),)
          : Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: sizefix(50, screenHeight)),
            height: screenHeight,
            width: screenWidth,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 1, 
               childAspectRatio: 2.4,
              ),
              itemCount: controller.listCommentChap.length,
              itemBuilder: (context, index) {
              return Obx(() {                        
                return ItemComment(screenHeight: screenHeight, screenWidth: screenWidth, commentChapComic: controller.listCommentChap[index],);
              });            
              },
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              padding: EdgeInsets.only(left: sizefix(10, screenWidth), right: sizefix(10, screenWidth)),
              width: screenWidth,
              height: sizefix(60, screenHeight),
              decoration: BoxDecoration(
                color: AppColors.lightWhite
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
                    },
                    child: Icon(Icons.arrow_back_ios, size: sizefix(16, screenHeight)),
                  ),
                  Padding(
                    padding:EdgeInsets.only(left: sizefix(20, screenWidth)),
                    child: TextCustom(text: "Bình luận", fontsize: sizefix(17, screenWidth),),
                  )
                ],
              ),
            )
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(left: sizefix(10, screenWidth), right: sizefix(10, screenWidth)),
              width: screenWidth,
              height: sizefix(80, screenHeight),
              decoration: BoxDecoration(
                border: Border.all( 
                  color: AppColors.grayBlack, 
                  width: 0.5, 
               ),   
              ),
              child: Row(
                children: [
                 Expanded(
                    child: TextFormField(          
                      cursorColor: AppColors.gray,
                      maxLines: null,
                      decoration: InputDecoration(                    
                        fillColor: Colors.white,
                        hintText: "Viết bình luận...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                      ),
                    ),
                  ),
                  IconButton(
                  onPressed: (){}, 
                  icon: const Icon(Icons.tag_faces_outlined)
                  ),
                  IconButton(
                  onPressed: (){}, 
                  icon: const Icon(Icons.send_rounded)
                  )

                ],
              ),
            )
          )
        ],
      )
    );
  }
}

