import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimanga_app/app/constants/app_function.dart';
import '../constants/app_colors.dart';
import '../models/chap_comic.dart';
import 'text_custom.dart';

double sizefix( double size , double screen){
   return Sizefix.sizefix(size, screen);
}
class ItemComment extends GetView{
  const ItemComment({super.key, required this.screenHeight, required this.screenWidth, required this.commentChapComic});
  final CommentChapComic commentChapComic;
  // ignore: prefer_typing_uninitialized_variables
  final screenWidth;
  // ignore: prefer_typing_uninitialized_variables
  final screenHeight;
  @override
  Widget build (BuildContext context) {
    return Container(
      padding: EdgeInsets.all(sizefix(10, screenWidth)),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: sizefix(0.1, screenWidth), color: Colors.grey),
          bottom: BorderSide(width: sizefix(0.1, screenWidth), color: Colors.grey)
        ),
      ),
      width: screenWidth,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(right: sizefix(10, screenWidth)),
            child: ClipOval(
              child: Image.network(
                commentChapComic.hinhNen?.isNotEmpty == true 
                   ? commentChapComic.hinhNen! 
                  : 'https://cdn4.iconfinder.com/data/icons/aami-web-internet/64/aami13-44-512.png', 
                height: sizefix(32, screenHeight),
                width: sizefix(32, screenWidth),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextCustom(text: commentChapComic.tenNguoiDung,fontWeight: FontWeight.bold, fontsize: sizefix(13, screenWidth),),
              Container(
                margin: EdgeInsets.only(top: sizefix(5, screenHeight)),
                padding: EdgeInsets.all(sizefix(5, screenHeight)),
                alignment: Alignment.center,
                height: sizefix(23, screenHeight),              
                decoration: BoxDecoration(
                  color: AppColors.RedPrimary,
                  borderRadius: BorderRadius.circular(sizefix(10, screenHeight))
                ),
                child: TextCustom(text: commentChapComic.bietHieu,fontsize: sizefix(10, screenWidth),color: AppColors.lightWhite, fontWeight: FontWeight.bold,),
              ),
              Padding(
                padding:  EdgeInsets.only(top: sizefix(15, screenHeight)),
                child: TextCustom(text: commentChapComic.content,fontsize: sizefix(12, screenWidth),),
              ),
              Row(
                children: [
                  TextCustom(text: commentChapComic.ngay,fontsize: sizefix(11, screenWidth), color: Colors.grey,),
                  Padding(
                    padding: EdgeInsets.only(left: sizefix(10, screenWidth), right: sizefix(60, screenWidth)),
                    child: TextCustom(text: commentChapComic.thoiGian,fontsize: sizefix(11, screenWidth), color: Colors.grey,),
                  ),
                  IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.flag_outlined, size: sizefix(20, screenWidth), color: Colors.grey,)
                  ),
                  IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.send, size: sizefix(20, screenWidth), color: Colors.grey,)
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}