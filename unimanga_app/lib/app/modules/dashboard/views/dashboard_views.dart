import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimanga_app/app/global_widgets/comic_items.dart';
import 'package:unimanga_app/app/modules/dashboard/bindings/dashboard_bindings.dart';
import 'package:unimanga_app/app/modules/dashboard/controllers/dashboard_controllers.dart';
import 'package:unimanga_app/app/modules/dashboard/views/Dashboard_child/list_comic_action.dart';
import 'package:unimanga_app/app/modules/dashboard/views/Dashboard_child/list_comic_hot.dart';
import 'package:unimanga_app/app/modules/infor_user/bindings/info_user_bindings.dart';
import 'package:unimanga_app/app/modules/infor_user/controllers/info_user_controllers.dart';
import 'package:unimanga_app/app/modules/infor_user/views/Info.dart';
import '../../../constants/index.dart';
import '../../../global_widgets/index.dart';
import '../../signin/views/SignIn.dart';
import 'Dashboard_child/carouseu.dart';
double sizefix( double size , double screen){
   return Sizefix.sizefix(size, screen);
}
class DashboardView extends GetView<DashboardController>{
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context){
     DashBoardBindings().dependencies();
     InforUserbinding().dependencies();final inforUserController = Get.find<InforUserController>();   
     final double screenWidth = MediaQuery.of(context).size.width;
     final double screenHeight = MediaQuery.of(context).size.height;
     return Scaffold(   
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: sizefix(130, screenHeight),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                    image: AssetImage(AppImages.HomeBackGround1, ),
                    fit: BoxFit.contain,
                  ),
                  ),
                ),
                Obx(() {
                final user = inforUserController.user.value;
                 return  SizedBox(
                  height: sizefix(80, screenHeight),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 90,
                          child: Image.asset(AppImages.Logoapp, fit: BoxFit.cover,),
                        ),
                        user == null
                        ?SizedBox(
                          width: 220,
                          height: sizefix(60, screenHeight),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 7),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.RedPrimary,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  height: 20,
                                  width: 65,
                                  child: 
                                  GestureDetector(
                                  onTap: (){
                                    Get.to(const Login_Screen());
                                  },
                                    child: TextCustom(text: "Đăng nhập", fontsize: 9, color: AppColors.lightWhite, fontWeight: FontWeight.bold,
                                  )),
                                ),                             
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.RedPrimary,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  height: 20,
                                  width: 65,
                                  child: TextCustom(text: "Đăng ký", fontsize: 9, color: AppColors.lightWhite, fontWeight: FontWeight.bold,),
                                ),
                                Icon(Icons.search, color: AppColors.RedPrimary,),
                                Icon(Icons.notifications, color: AppColors.RedPrimary,)
                              ],
                            ),
                          ),
                        )
                        :SizedBox(
                          width: sizefix(190, screenWidth),
                          height: sizefix(60, screenHeight),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 7),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () => Get.to(const InfoScreen()),
                                  child: ClipOval(
                                    child: Image.network(
                                     user.imageUrl!.isNotEmpty == true
                                     ?user.imageUrl!
                                     :'https://www.clipartkey.com/mpngs/m/93-935185_unknown-character-clipart-png-download-unknown-person-picture.png',
                                     height: sizefix(32, screenHeight),
                                     width: sizefix(32, screenWidth),
                                     fit: BoxFit.cover,               
                                    ),                               
                                  ),
                                ),
                                Icon(Icons.search, color: AppColors.RedPrimary,),
                                Icon(Icons.notifications, color: AppColors.RedPrimary,)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
                }),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: sizefix(10, screenWidth), right: sizefix(10, screenWidth)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: sizefix(15, screenHeight),),
                  carouseu(screenWidth: screenWidth, screenHeight: screenHeight),
                  SizedBox(height: sizefix(15, screenHeight),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Column(
                       children: [
                         SizedBox(
                          height: sizefix(35, screenHeight),
                          width: sizefix(35, screenHeight),
                          child: Image.asset(AppImages.icLogorankbook),
                          ),
                          TextCustom(text: "Xếp hạng", color: AppColors.blackPrimary, fontWeight: FontWeight.bold, fontsize: sizefix(10, screenWidth),)
                       ],
                     ),
                     Column(
                       children: [
                         SizedBox(
                          height: sizefix(35, screenHeight),
                          width: sizefix(35, screenHeight),
                          child: Image.asset(AppImages.icLogorankuser),
                          ),
                          TextCustom(text: "Top User", color: AppColors.blackPrimary, fontWeight: FontWeight.bold,fontsize: sizefix(10, screenWidth),)
                       ],
                     ),
                     Column(
                       children: [
                         SizedBox(
                          height: sizefix(35, screenHeight),
                          width: sizefix(35, screenHeight),
                          child: Image.asset(AppImages.icLogonewbook1),
                          ),
                          TextCustom(text: "Mới nhất", color: AppColors.blackPrimary, fontWeight: FontWeight.bold,fontsize: sizefix(10, screenWidth),)
                       ],
                     ),
                  ],),
                  SizedBox(height: sizefix(20, screenHeight),),
                  //Truyện đề cử
                  ListComicHotView(screenHeight: screenHeight, screenWidth: screenWidth),

                  SizedBox(height: sizefix(15, screenHeight),),
                  //Truyện action
                  ListComicActionView(screenHeight: screenHeight, screenWidth: screenWidth),
                  
                  Row(
                      children: [
                         SizedBox(
                          height: sizefix(22, screenHeight),
                          width: sizefix(22, screenHeight),
                          child: Image.asset(AppImages.icnew),
                        ),
                        TextCustom(text: "Truyện mới cập nhật", fontWeight: FontWeight.bold, color: AppColors.black, fontsize: sizefix(15, screenWidth),),
                      ],
                  ),
                  GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 0.58,
                    shrinkWrap: true,
                    crossAxisSpacing: 10, 
                    mainAxisSpacing: 10, 
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(6, (index){          
                      return const ComicItem();  
                    }),
                  ),
                  const SizedBox(height: 50),                                      
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
  
}




