import 'package:get/get.dart';

import '../../services/main.service.dart';
import '../../src/src.dart';
import '../../utils/utils.dart';
import '../../views/views.dart';

class LoginController extends GetxController {
  MainService mainService = Get.find();

  final formKey = GlobalKey<FormState>();

  Map<String, String> errors = {};

  final emailController = TextEditController(name: 'email');
  final passwordController = TextEditController();

  login() async {
    if (emailController.text != Consts.testUser.email) {
      errors['email'] = 'Invalid email';
    } else if (passwordController.text != Consts.testUser.password) {
      errors['password'] = 'Invalid password';
    }

    if (formKey.currentState!.validate()) {
      DialogsView.loading().show();
      await mainService.settings!.onAuth(Consts.testUser);
      await Future.delayed(const Duration(seconds: 2));
      formKey.currentState!.save();
      Get.back();
      await DialogsView.message('Login', 'Successfully login').show();
      RouteManager.to(PagesInfo.home, clearHeaders: true);
    }
  }
}
