import 'package:get/get.dart';

import '../../services/main.service.dart';
import '../../utils/utils.dart';
import '../../views/views.dart';

class HomeController extends GetxController {
  MainService mainService = Get.find();

  PageController pageController = PageController();

  int currentTabIndex = 0;

  Future logout() async {
    bool logout = await DialogsView.message(
          'Logout',
          'Are sure you want to logout?',
          actions: DialogAction.rYesCancel,
        ).show() ??
        false;
    if (logout) {
      mainService.settings!.logout();
      RouteManager.to(PagesInfo.start, clearHeaders: true);
    }
  }
}
