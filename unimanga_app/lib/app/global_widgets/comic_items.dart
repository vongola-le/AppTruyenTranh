import 'package:flutter/material.dart';
import 'package:unimanga_app/app/constants/app_colors.dart';
import 'package:unimanga_app/app/constants/app_function.dart';
import 'package:unimanga_app/app/global_widgets/index.dart';

import '../constants/app_images.dart';

double sizefix( double size , double screen){
   return Sizefix.sizefix(size, screen);
}
class ComicItem extends StatefulWidget {
  const ComicItem({super.key});

  @override
  State<ComicItem> createState() => _ComicItemState();
}

class _ComicItemState extends State<ComicItem> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double itemWidth = screenWidth * 0.4;
    final double imageHeight = itemWidth * 0.75;
    return Container(
      padding: EdgeInsets.only(
          right: screenWidth * 0.02, 
          left:screenWidth * 0.02,
          top: screenWidth * 0.01, 
      ),
      width:sizefix(110, screenWidth),
      // decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.circular(screenWidth * 0.01),
      //     border: Border.all(color: AppColors.grayLight,width: screenWidth * 0.0001),
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.grey.withOpacity(0.5), 
      //         spreadRadius: 1, 
      //         blurRadius: 2, 
      //         offset: Offset(1, 2),
      //       ),
      //     ]
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {},
              child:Container(
                height: sizefix(120, screenHeight),
                width: sizefix(110, screenWidth),
                decoration: BoxDecoration(
                  color: AppColors.black,
                  image: const DecorationImage(
                    image: AssetImage(AppImages.hinhnentruyen3),
                    fit: BoxFit.cover, 
                    alignment: Alignment.center,
                  ),
                ),

              )
          ),
          TextCustom(
            text: "Konosuba: Phước lành cho thế giới",
            fontWeight: FontWeight.bold,
            fontsize: sizefix(11, screenWidth),
            maxline: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Container(
            padding: EdgeInsets.only(
                top: sizefix(5, screenHeight),
                bottom:  sizefix(10, screenHeight),
            ),
            child: TextCustom(
              text: "Chương 103",
              fontsize: sizefix(9, screenWidth),
              //fontWeight: FontWeight.bold,
              color: AppColors.grayLight,
              
            ),
          )
        ],
      ),
    );
  }
}