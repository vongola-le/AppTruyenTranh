import 'package:unimanga_app/app/modules/dashboard/provider/dashboard_provider.dart';

import '../../../models/user.dart';
import '../../../models/chap_comic.dart';
import '../../../models/comic_model.dart';

class DashboardReponsitory {
 final DashboardProvider dashboardProvider;
 DashboardReponsitory({required this.dashboardProvider});
 Future<List<ComicModel>> getComicList() =>
  dashboardProvider.getComicListHot();
 Future<List<ComicModel>> getFilterComic(String stt) =>
  dashboardProvider.getFilterComic(stt);
 Future<List<ComicModel>> getComicListWithCate(String cate) =>
  dashboardProvider.getComicListWithCate(cate);
  Future<ComicModel?> getComicById(String id) =>
  dashboardProvider.getComicById(id);
  Future<List<ImageChap>> getImageChapComicById(String id, String idChuong) =>
    dashboardProvider.getImageChapComicById(id, idChuong);
  Future<Users?> getUserByUid(String uid) =>
    dashboardProvider.getUserByUid(uid);
}