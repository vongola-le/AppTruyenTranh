
import 'package:get/get.dart';
import 'package:unimanga_app/app/models/category_comic_model.dart';
import '../repository/book_case_repository.dart';


class BookCaseController extends GetxController{
// @override
  // void onInit() {
  //   super.onInit();
  //   fetchCatogoryComic();
  //   print(listCatorogy.value);
  // } 
 final BookCaseReponsitory reponsitory;
 BookCaseController({required this.reponsitory});
 var listCatorogy = <categoryComicModel>[].obs;


}
