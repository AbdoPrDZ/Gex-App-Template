import 'package:get/get.dart';

import '../../src/ui_theme.dart';
import '../../utils/utils.dart' as utils;
import '../../views/views.dart';
import 'controller.dart';

class LoginPage extends utils.Page<LoginController> {
  LoginPage({Key? key}) : super(controller: LoginController(), key: key);

  @override
  LoginController get controller => super.controller!;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => AppBar(
        backgroundColor: UIThemeColors.primary,
        title: const Text('Login'),
      );

  @override
  Widget buildBody(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            onChanged: () {
              if (controller.errors.isNotEmpty) controller.errors = {};
            },
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: UIThemeColors.text1,
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                    ),
                  ),
                ),
                TextEditView(
                  controller: controller.emailController,
                  hint: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    } else if (!value.isEmail) {
                      return "Please enter valid email (example@mail.com)";
                    } else if (controller.errors.containsKey('email')) {
                      return controller.errors['email'];
                    }
                    return null;
                  },
                ),
                TextEditView(
                  controller: controller.passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  hint: 'Password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    } else if (controller.errors.containsKey('password')) {
                      return controller.errors['password'];
                    }
                    return null;
                  },
                ),
                ButtonView.text(onPressed: controller.login, text: 'Login')
              ],
            ),
          ),
        ),
      );
}
