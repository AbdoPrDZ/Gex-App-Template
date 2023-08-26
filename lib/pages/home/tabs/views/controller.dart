import 'dart:io';

import 'package:get/get.dart';

import '../../../../services/main.service.dart';
import '../../../../views/views.dart';

class ViewsTabController extends GetxController {
  MainService mainService = Get.find();

  final formKey = GlobalKey<FormState>();

  final textEditController = TextEditController(name: 'text_edit');

  File? pickedFile;

  int dropDownIndex = -1;

  final blurValueController = TextEditController(text: '5');
  double blurValue = 5;

  Map<String, List<File>> images = {
    'CameraMulti': [],
    'GalleryMulti': [],
    'CameraSingle': [],
    'GallerySingle': [],
  };

  @override
  void onInit() {
    blurValueController.addListener(() {
      blurValue = double.tryParse(
            blurValueController.text.isNotEmpty
                ? blurValueController.text
                : '0',
          ) ??
          blurValue;
      print(blurValue);
      update();
    });
    super.onInit();
  }

  submit() {
    if (formKey.currentState?.validate() == true) {
      formKey.currentState!.save();
    }
  }
}
