
import 'package:flutter/material.dart';
import 'package:unimanga_app/app/global_widgets/index.dart';
import 'package:unimanga_app/app/modules/comic_detail/views/detail_child/detail_page.dart';
import '../../../constants/index.dart';


double sizefix( double size , double screen){
   return Sizefix.sizefix(size, screen);
}
class ComicDetail extends StatefulWidget {
  const ComicDetail({super.key});

  @override
  State<ComicDetail> createState() => _ComicDetailState();
}
class _ComicDetailState extends State<ComicDetail> {
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
                    title: TextCustom(text: "Thanh gươm diệt quỷ", color: Colors.white.withOpacity(0.1),),
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
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(AppImages.demonslayder),
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
                                          TextCustom(text: "480k", fontsize: sizefix(20, screenWidth),fontWeight: FontWeight.bold,),
                                          TextCustom(text: "Số like", color: Colors.grey, fontsize: sizefix(10, screenWidth),)
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          TextCustom(text: "480k", fontsize: sizefix(20, screenWidth),fontWeight: FontWeight.bold,),
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
                                              TextCustom(text: "4.7", fontsize: sizefix(20, screenWidth),fontWeight: FontWeight.bold,),
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
                  DetailPage(),
                  Center(child: Text('Nội dung của tab Chappter')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class ComicDetail extends GetView{
//   @override
//    Widget build(BuildContext context){ 
//     return DefaultTabController(
//       length: 2, 
//       child: Scaffold(
//         appBar: AppBar(
//           title: TextCustom(text: "Chi tiết truyện"),
//           bottom: const PreferredSize(
//             preferredSize: Size.fromHeight(sizefix(30, )), 
//             child: child),
//         ),
        
//       )
//     );
//    }
// }
