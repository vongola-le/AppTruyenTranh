import 'package:get/get.dart';
import 'package:unimanga_app/app/models/chap_comic.dart';
import 'package:unimanga_app/app/modules/chapter/repository/Chapter_reposotory.dart';

import '../views/chapter_view.dart';

class ChapterController extends GetxController {

  @override
  void onInit() {
    super.onInit();
  }
  ChapterController({required this.chapterRepository});
  final ChapterRepository chapterRepository;
  // Sử dụng RxBool để quản lý trạng thái hiển thị của Container
  var isContainerVisible = true.obs;

  // Phương thức để chuyển đổi trạng thái hiển thị
  void toggleContainerVisibility() {
    isContainerVisible.value = !isContainerVisible.value;
  }
    var isNextChapterPressed = false.obs;

  var chapComicModel = ChapComicModel().obs;
  void goToNextChapter(List<ChapComicModel> chapters , int currentIndex) {
    if (currentIndex < chapters.length - 1) {
      ChapComicModel nextChapter = chapters[currentIndex + 1];
      chapComicModel.value = nextChapter;
    } else {
      print('Đây là chương cuối cùng.');
    }
    isNextChapterPressed.value = true; // Cập nhật trạng thái của nút
    update(); 
  }
  
  

}

