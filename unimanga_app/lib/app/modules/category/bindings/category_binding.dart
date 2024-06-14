
import 'package:get/get.dart';
import 'package:unimanga_app/app/modules/category/controllers/dashboard_controllers.dart';
import 'package:unimanga_app/app/modules/category/provider/dashboard_provider.dart';
import 'package:unimanga_app/app/modules/category/repository/dashboard_repository.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryProvider());
    Get.lazyPut(() => CategoryReponsitory(categoryReponsitory: Get.find<CategoryProvider>()));
    Get.put(CategoryController(categoryReponsitory: Get.find<CategoryReponsitory>()));
  }
}
