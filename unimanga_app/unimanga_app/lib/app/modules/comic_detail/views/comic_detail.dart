
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:unimanga_app/app/global_widgets/index.dart';
import 'package:unimanga_app/app/models/comic_model.dart';
import 'package:unimanga_app/app/modules/comic_detail/views/detail_child/chappter_page.dart';
import 'package:unimanga_app/app/modules/comic_detail/views/detail_child/detail_page.dart';
import '../../../constants/index.dart';


double sizefix( double size , double screen){
   return Sizefix.sizefix(size, screen);
}
class ComicDetail extends GetView {
  final ComicModel comic;

  ComicDetail({required this.comic});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Container(
            color: AppColors.lightWhite,
            child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: AppColors.lightWhite,
                    leading: GestureDetector(
                       onTap: () => Get.back(),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: sizefix(32, screenHeight)),
                        child: Icon(Icons.arrow_back_ios_new, color:  AppColors.lightWhite,),
                      ),
                    ),
                    expandedHeight:sizefix(300, screenHeight), // Chiều cao ban đầu của SliverAppBar
                    floating: true,
                    pinned: true, // Giữ AppBar luôn hiển thị
                    flexibleSpace: FlexibleSpaceBar(
                      background: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: sizefix(180, screenHeight),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(comic.anhBiaTruyen!),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: sizefix(80, screenHeight),
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                          
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: sizefix(165, screenHeight)),
                                height: sizefix(100, screenHeight),
                                decoration: BoxDecoration(
                                  color: AppColors.lightWhite,
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: sizefix(12, screenHeight),right: sizefix(12, screenHeight), top: sizefix(30, screenHeight)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          TextCustom(text: comic.luotDanhGia, fontsize: sizefix(20, screenWidth),fontWeight: FontWeight.bold,),
                                          TextCustom(text: "Số like", color: Colors.grey, fontsize: sizefix(10, screenWidth),)
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          TextCustom(text: comic.luotXem, fontsize: sizefix(20, screenWidth),fontWeight: FontWeight.bold,),
                                          TextCustom(text: "Độ hot", color: Colors.grey, fontsize: sizefix(10, screenWidth),)
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              TextCustom(text: comic.diemDanhGia, fontsize: sizefix(20, screenWidth),fontWeight: FontWeight.bold,),
                                              Icon(Icons.star_rate_rounded, color: AppColors.yellowPrimary, size: sizefix(20, screenWidth),)                                       
                                            ],
                                          ),
                                          TextCustom(text: "300 người đánh giá >", color: Colors.grey, fontsize: sizefix(10, screenWidth),)
                                        ],
                                      ),
                                  
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 10,
                            color: AppColors.gray,
                          )
                        ],
                      ),
                    ),
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(kToolbarHeight),
                      child: Material(
                        color: AppColors.lightWhite, // Thay đổi màu nền ở đây
                        child: TabBar(
                          labelColor: AppColors.black,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: AppColors.RedPrimary,
                          dividerColor: AppColors.lightWhite,
                          tabs: const [
                            Tab(text: 'Chi tiết'),
                            Tab(text: 'Chappter'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: [
                  DetailPage(comics: comic,),
                  ChappterPage(screenHeight: screenHeight, screenWidth: screenWidth, comic: comic,)
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            alignment: Alignment.center ,
            height: sizefix(50, screenHeight),
            child: Container(
              alignment: Alignment.center,
              height: sizefix(40, screenHeight),
              width: sizefix(300, screenWidth), 
              decoration: BoxDecoration(
                color: AppColors.RedPrimary,
                borderRadius: BorderRadius.circular(sizefix(20, screenWidth))
              ), 
              child:  TextCustom(
                text: "Bắt đầu đọc", color: AppColors.lightWhite, fontsize: sizefix(15, screenHeight), fontWeight: FontWeight.bold,)
              ),
          )
        ),
      ),
    );
  }
}

