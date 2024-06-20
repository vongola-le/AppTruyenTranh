import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimanga_app/app/constants/app_function.dart';
import 'package:unimanga_app/app/constants/index.dart';
import 'package:unimanga_app/app/global_widgets/index.dart';

double sizefix( double size , double screen){
   return Sizefix.sizefix(size, screen);
}

class CommentChapComicView extends GetView{
  const CommentChapComicView({super.key});

  @override
  Widget build (BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 100),
            height: screenHeight,
            width: screenWidth,
            decoration: BoxDecoration( 
                
            ),
            child: Column(
              children: [
                ItemComment(screenHeight: screenHeight, screenWidth: screenWidth,),
              ]

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
                    child: Icon(Icons.arrow_back_ios, size: sizefix(20, screenHeight)),
                  ),
                  Padding(
                    padding:EdgeInsets.only(left: sizefix(20, screenWidth)),
                    child: TextCustom(text: "Bình luận", fontsize: sizefix(20, screenWidth),),
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
                // borderRadius: const BorderRadius.only(
                //   topLeft: Radius.circular(15.0),
                //   topRight: Radius.circular(15.0),
                // ),
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
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
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

class ItemComment extends GetView{
  const ItemComment({super.key, required this.screenHeight, required this.screenWidth});
  final screenWidth;
  final screenHeight;
  @override
  Widget build (BuildContext context) {
    return Container(
      //height: 100,
      width: screenWidth,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(right: sizefix(10, screenWidth)),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.RedPrimary,
                borderRadius: BorderRadius.circular(15),
              ),
              height: sizefix(32, screenHeight),
              width: sizefix(32, screenWidth),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextCustom(text: "Trần Long Giang",fontWeight: FontWeight.bold, fontsize: sizefix(13, screenWidth),),
              Container(
                margin: EdgeInsets.only(top: sizefix(5, screenHeight)),
                padding: EdgeInsets.all(sizefix(5, screenHeight)),
                alignment: Alignment.center,
                height: sizefix(23, screenHeight),              
                decoration: BoxDecoration(
                  color: AppColors.RedPrimary,
                  borderRadius: BorderRadius.circular(sizefix(10, screenHeight))
                ),
                child: TextCustom(text: "Thần tiên hạ giới",fontsize: sizefix(10, screenWidth),color: AppColors.lightWhite, fontWeight: FontWeight.bold,),
              ),
              Padding(
                padding:  EdgeInsets.only(top: sizefix(15, screenHeight)),
                child: TextCustom(text: "Truyện siêu hay luôn á",fontsize: sizefix(12, screenWidth),),
              ),
              Row(
                children: [
                  TextCustom(text: "30/07/2003",fontsize: sizefix(11, screenWidth), color: Colors.grey,),
                  Padding(
                    padding: EdgeInsets.only(left: sizefix(10, screenWidth)),
                    child: TextCustom(text: "7:30 CH",fontsize: sizefix(11, screenWidth), color: Colors.grey,),
                  ),
                  IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.flag_outlined, size: sizefix(20, screenWidth), color: AppColors.RedPrimary,)
                  ),
                  IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.send, size: sizefix(20, screenWidth), color: AppColors.RedPrimary,)
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