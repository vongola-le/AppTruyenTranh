import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:unimanga_app/app/modules/book_case/views/book_case_child/book_save.dart';
import '../../../constants/index.dart';
import '../../../global_widgets/index.dart';

double sizefix( double size , double screen){
   return Sizefix.sizefix(size, screen);
}
class BookCaseView extends GetView {
  const BookCaseView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: DefaultTabController(
        length: 3, // Số lượng tab
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(sizefix(60, screenHeight)), // Độ cao mong muốn của AppBar
            child: AppBar(
              backgroundColor: Colors.white,
              bottom: const TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.red, // Màu chỉ báo của tab được chọn
                tabs: [
                  Tab(text: 'Truyện Đã Lưu',),
                  Tab(text: 'Truyện Đã Thích'),
                  Tab(text: 'Truyện Đã Đ'),
                ],
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              ComicSaved(),
              Text("Tab 2 content"),
              Text("Tab 3 content"),
            ],
          ),
        ),
      ),
    );
  }
}
