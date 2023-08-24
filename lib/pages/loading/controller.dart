import 'package:get/get.dart';

import '../../services/main.service.dart';
import '../../utils/utils.dart';

class LoadingController extends GetxController {
  MainService mainService = Get.find();

  @override
  void onReady() {
    loading();
    super.onReady();
  }

  void loading() async {
    await mainService.init();
    RouteManager.to(
      mainService.currentUser != null ? PagesInfo.home : PagesInfo.start,
      clearHeaders: true,
    );
  }
}
