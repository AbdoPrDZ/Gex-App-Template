import 'package:get/get.dart';

import '../../src/src.dart';
import '../../utils/utils.dart' as utils;
import '../../views/views.dart';
import 'controller.dart';

class RegisterPage extends utils.Page<RegisterController> {
  RegisterPage({Key? key}) : super(controller: RegisterController(), key: key);

  @override
  RegisterController get controller => super.controller!;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => AppBar(
        backgroundColor: UIThemeColors.primary,
        title: const Text('Register'),
      );

  @override
  Widget buildBody(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: controller.formKey,
          onChanged: () {
            if (controller.errors.isNotEmpty) controller.errors = {};
          },
          child: SingleChildScrollView(
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    'Register',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: UIThemeColors.text1,
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                    ),
                  ),
                ),
                TextEditView(
                  controller: controller.firstNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "First name is required";
                    }
                    return null;
                  },
                  hint: 'First name',
                ),
                TextEditView(
                  controller: controller.lastNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Last name is required";
                    }
                    return null;
                  },
                  hint: 'Last name',
                ),
                TextEditView(
                  controller: controller.emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    } else if (!value.isEmail) {
                      return "Please enter valid email (example@mail.com)";
                    }
                    return null;
                  },
                  hint: 'Email',
                ),
                DropDownView(
                  value: controller.gander,
                  items: const [
                    DropdownMenuItem(value: '', child: Text('Gander')),
                    DropdownMenuItem(value: 'Male', child: Text('Male')),
                    DropdownMenuItem(value: 'Female', child: Text('Female')),
                  ],
                  onChanged: (value) {
                    if (value != null && value != controller.gander) {
                      controller.gander = value;
                      controller.update();
                    }
                  },
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please select your gander";
                    }
                    return null;
                  },
                ),
                TextEditView(
                  controller: controller.passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                  hint: 'Password',
                ),
                TextEditView(
                  controller: controller.confirmController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Confirm is required";
                    } else if (controller.passwordController.text.isNotEmpty &&
                        controller.passwordController.text != value) {
                      return "Password and confirm must be equals";
                    }
                    return null;
                  },
                  hint: 'Confirm',
                ),
                ButtonView.text(
                    onPressed: controller.register, text: 'Register')
              ],
            ),
          ),
        ),
      );
}
