import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/main.service.dart';
import '../src/src.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (route == PagesInfo.initialPage.route) return null;

    MainService mainService = Get.find();

    if (mainService.currentUser != null &&
        PagesInfo.unAuthPages.contains(route)) {
      return RouteSettings(name: PagesInfo.onAuthPage.route);
    } else if (mainService.currentUser == null &&
        !PagesInfo.unAuthPages.contains(route)) {
      return RouteSettings(name: PagesInfo.onUnAuthPage.route);
    }

    return null;
  }
}
