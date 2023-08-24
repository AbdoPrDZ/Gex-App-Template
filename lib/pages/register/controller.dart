import 'package:get/get.dart';

import '../../models/models.dart';
import '../../services/main.service.dart';
import '../../src/src.dart';
import '../../utils/utils.dart';
import '../../views/views.dart';

class RegisterController extends GetxController {
  MainService mainService = Get.find();

  final formKey = GlobalKey<FormState>();

  Map<String, String> errors = {};

  final firstNameController = TextEditController(name: 'firstname');
  final lastNameController = TextEditController(name: 'lastname');
  final emailController = TextEditController(name: 'email');
  final passwordController = TextEditController();
  final confirmController = TextEditController();

  String gander = '';

  register() async {
    if (formKey.currentState!.validate()) {
      Consts.testUser = UserModel(
        firstNameController.text,
        lastNameController.text,
        emailController.text,
        gander,
        passwordController.text,
      );

      DialogsView.loading().show();
      await mainService.settings!.onAuth(Consts.testUser);
      await Future.delayed(const Duration(seconds: 2));
      formKey.currentState!.save();
      Get.back();
      await DialogsView.message('Register', 'Successfully registering').show();
      RouteManager.to(PagesInfo.home, clearHeaders: true);
    }
  }
}
