import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:unimanga_app/app/models/chap_comic.dart';
import 'package:unimanga_app/app/modules/dashboard/repository/dashboard_repository.dart';
import '../../../models/User.dart';
import '../../../models/comic_model.dart';
import '../../home/views/home_views.dart';

class DashboardController extends GetxController {
  final DashboardReponsitory dashboardReponsitory;

  //Timer? _timer;
  DashboardController({required this.dashboardReponsitory});

  var user = Rxn<Users>();
  User? firebaseUser = FirebaseAuth.instance.currentUser;

  @override
  void onInit() {
    super.onInit();
    fetchComicList();
    fetchComicListAction('Action');
  }
  // @override
  // void onClose() {
  //   _timer?.cancel();
  //   super.onClose();
  // }

  var listchap = <ImageChap>[].obs;
  var listcomic = <ComicModel>[].obs;
  var listcomicAction = <ComicModel>[].obs;
  var comic  = ComicModel().obs;
  Future<void> fetchUser(String uid) async {
    try {
      Users? fetchedUser = await dashboardReponsitory.getUserByUid(uid);
      if (fetchedUser != null) {
        user.value = fetchedUser;
      } else {
        print('User information not found');
      }
    } catch (e) {
      print('Error fetching user information: $e');
    }
  }
   Future<void> fetchImageChap(String id, String idChap) async {
    try {
      List<ImageChap> comics = await dashboardReponsitory.getImageChapComicById(id, idChap);
      listchap.value = comics;
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }
  Future<void> fecchComic(String id) async {
    try {
      ComicModel? comics = await dashboardReponsitory.getComicById(id);
      comic.value = comics!;
    } catch (e) {
      print('Error fetching comic: $e');
    }
  }

  Future<void> fetchComicList() async {
    try {
      List<ComicModel> comics = await dashboardReponsitory.getComicList();
      listcomic.value = comics;
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }
  

  Future<void> fetchComicListAction(String cate) async {
    try {
      List<ComicModel> comics = await dashboardReponsitory.getComicListWithCate(cate);
      listcomicAction.value = comics;
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }
  
}
