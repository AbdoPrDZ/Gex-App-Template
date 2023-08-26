import 'dart:io';

import 'package:get/get.dart';

import '../../../../utils/utils.dart' as utils;
import '../../../../utils/utils.dart';
import '../../../../views/views.dart';
import 'controller.dart';

class ViewsTab extends utils.Page<ViewsTabController> {
  ViewsTab({Key? key}) : super(controller: ViewsTabController(), key: key);

  @override
  ViewsTabController get controller => super.controller!;

  @override
  Widget? buildFloatingActionButton(BuildContext context) =>
      FloatingActionButton(
        onPressed: () {
          controller.submit();
          print('Floating Button Pressed');
        },
        child: const Icon(Icons.upload_outlined),
      );

  @override
  Widget buildBody(BuildContext context) => Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'TextEdits: ',
                    style: TextStyle(fontSize: 20, color: UIThemeColors.text1),
                  ),
                ),
                TextEditView(
                  label: "TextEditView",
                  hint: 'Text',
                  controller: controller.textEditController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Text is required';
                    }
                    return null;
                  },
                ),
                TextEditView(
                  label: "TextEditView(For Passwords)",
                  hint: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    } else if (value.length < 6) {
                      return 'Password must be not less then 6 characters';
                    }
                    return null;
                  },
                ),
                TextEditView(
                  label: "TextEditView(For Datetime)",
                  hint: 'Datetime',
                  keyboardType: TextInputType.datetime,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2050),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    } else if (MDateTime.fromString(value) == null) {
                      return 'Please enter valid datetime';
                    }
                    return null;
                  },
                ),
                TextEditView(
                  label: "TextEditView(For Address)",
                  hint: 'Address',
                  keyboardType: TextInputType.streetAddress,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2050),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    } else if (MDateTime.fromString(value) == null) {
                      return 'Please enter valid datetime';
                    }
                    return null;
                  },
                ),
                const Divider(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'FilePicker Field: ',
                    style: TextStyle(fontSize: 20, color: UIThemeColors.text1),
                  ),
                ),
                FilePickerFieldView<File>(
                  label: "Pick File",
                  hint: "Pick File",
                  onPick: (file) {
                    print(file?.path);
                    controller.pickedFile = file;
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'file is required';
                    } else if (!value.existsSync()) {
                      return 'The file is not exists';
                    }
                    return null;
                  },
                ),
                const Divider(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Buttons: ',
                    style: TextStyle(fontSize: 20, color: UIThemeColors.text1),
                  ),
                ),
                ButtonView(
                  onPressed: () => print('Simple Button Pressed'),
                  child: const Text('Simple Button'),
                ),
                ButtonView.text(
                  onPressed: () => print('Text Button Pressed'),
                  text: 'Text Button',
                ),
                CirclerButtonView(
                  size: 90,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: SizedBox(
                    width: 78,
                    height: 78,
                    child: CircleAvatar(
                      backgroundColor: UIThemeColors.iconFg,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(Consts.logo),
                      ),
                    ),
                  ),
                  onPressed: () => print('Simple Circle Button Pressed'),
                ),
                CirclerButtonView.icon(
                  Icons.person,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  size: 90,
                  onPressed: () => print('Icon Circle Button Pressed'),
                ),
                OutlineButtonView(
                  onPressed: () => print('Simple Outline Button Pressed'),
                  child: const Text('Simple Outline Button'),
                ),
                OutlineButtonView.text(
                  'Text Circle Button',
                  onPressed: () => print('Text Outline Button Pressed'),
                ),
                OutlineButtonView.icon(
                  Icons.person,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  size: 90,
                  onPressed: () => print('Icon Outline Button Pressed'),
                ),
                const Divider(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'DropDown: ',
                    style: TextStyle(fontSize: 20, color: UIThemeColors.text1),
                  ),
                ),
                DropDownView<int>(
                  value: controller.dropDownIndex,
                  items: [
                    const DropdownMenuItem(value: -1, child: Text('Items')),
                    for (int i = 0; i < 10; i++)
                      DropdownMenuItem(value: i, child: Text('Item $i'))
                  ],
                  onChanged: (value) {
                    if (value != null || controller.dropDownIndex != value) {
                      controller.dropDownIndex = value!;
                      controller.update();
                    }
                  },
                  validation: (value) {
                    if (value == null || controller.dropDownIndex == -1) {
                      return 'Please Select item';
                    }
                    return null;
                  },
                ),
                const Divider(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Dialogs: ',
                    style: TextStyle(fontSize: 20, color: UIThemeColors.text1),
                  ),
                ),
                ButtonView.text(
                  onPressed: () {
                    DialogsView.message('Title', 'Message').show();
                  },
                  text: 'Show DialogsView.text',
                ),
                ButtonView.text(
                  onPressed: () async {
                    DialogsView.loading().show();
                    await Future.delayed(const Duration(seconds: 3));
                    Get.back();
                  },
                  text: 'Show DialogsView.loading',
                ),
                ButtonView.text(
                  onPressed: () {
                    DialogsView.form(
                      title: 'Dialog Form',
                      fields: [
                        DialogFormField.textEdit(
                          name: 'field_1',
                          label: 'Field 1',
                          controller: TextEditController(),
                        ),
                        DialogFormField.textEdit(
                          name: 'field_2',
                          label: 'Field 2',
                          controller: TextEditController(),
                        ),
                      ],
                      actions: [
                        DialogAction(
                          text: 'Submit',
                          onPressed: () {
                            print('Dialogs Form Submit Pressed');
                            Get.back();
                          },
                        ),
                        DialogAction(
                          text: 'Cancel',
                          actionColor: UIThemeColors.danger,
                          onPressed: () {
                            print('Dialogs Form Cancel Pressed');
                            Get.back();
                          },
                        ),
                      ],
                    ).show();
                  },
                  text: 'Show DialogsView.form',
                ),
                const Divider(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Blurred Box: ',
                    style: TextStyle(fontSize: 20, color: UIThemeColors.text1),
                  ),
                ),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: UIThemeColors.cardBg1,
                    image: const DecorationImage(
                      image: AssetImage(Consts.logo),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: BlurBoxView(
                    blur: controller.blurValue,
                  ),
                ),
                TextEditView(
                  controller: controller.blurValueController,
                  keyboardType: TextInputType.number,
                  hint: 'Bluer Value',
                ),
                const Divider(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ImagePicker: ',
                    style: TextStyle(fontSize: 20, color: UIThemeColors.text1),
                  ),
                ),
                ImagePickerFieldView(
                  label: 'Images (Camera Multi):',
                  imageSource: ImagePickerSource.cameraMulti,
                  images: controller.images['CameraMulti']!,
                  onPick: (image) async {
                    controller.images['CameraMulti']!.add(image);
                    controller.update();
                    return true;
                  },
                  onRemove: (image) async {
                    controller.images['CameraMulti']!.remove(image);
                    controller.update();
                    return true;
                  },
                  validator: (images) {
                    if (images == null || images.isEmpty) {
                      return 'Please select Images';
                    }
                    return null;
                  },
                ),
                ImagePickerFieldView(
                  label: 'Images (Camera Single):',
                  imageSource: ImagePickerSource.cameraSingle,
                  images: controller.images['CameraSingle']!,
                  onPick: (image) async {
                    controller.images['CameraSingle']!.add(image);
                    controller.update();
                    return true;
                  },
                  onRemove: (image) async {
                    controller.images['CameraSingle']!.remove(image);
                    controller.update();
                    return true;
                  },
                  validator: (images) {
                    if (images == null || images.isEmpty) {
                      return 'Please select Image';
                    }
                    return null;
                  },
                ),
                ImagePickerFieldView(
                  label: 'Images (Gallery Multi):',
                  imageSource: ImagePickerSource.galleryMulti,
                  images: controller.images['GalleryMulti']!,
                  onPick: (image) async {
                    controller.images['GalleryMulti']!.add(image);
                    controller.update();
                    return true;
                  },
                  onRemove: (image) async {
                    controller.images['GalleryMulti']!.remove(image);
                    controller.update();
                    return true;
                  },
                  validator: (images) {
                    if (images == null || images.isEmpty) {
                      return 'Please select Images';
                    }
                    return null;
                  },
                ),
                ImagePickerFieldView(
                  label: 'Images (Gallery Single):',
                  imageSource: ImagePickerSource.gallerySingle,
                  images: controller.images['GallerySingle']!,
                  onPick: (image) async {
                    controller.images['GallerySingle']!.add(image);
                    controller.update();
                    return true;
                  },
                  onRemove: (image) async {
                    controller.images['GallerySingle']!.remove(image);
                    controller.update();
                    return true;
                  },
                  validator: (images) {
                    if (images == null || images.isEmpty) {
                      return 'Please select Image';
                    }
                    return null;
                  },
                ),
                const Divider(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'NetworkImage: ',
                    style: TextStyle(fontSize: 20, color: UIThemeColors.text1),
                  ),
                ),
                const NetworkImageView(
                  'https://swapps.com/wp-content/uploads/2018/07/trying-out-flutter-1024x576.jpg',
                  height: 300,
                ),
                const Divider(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'SeeMore: ',
                    style: TextStyle(fontSize: 20, color: UIThemeColors.text1),
                  ),
                ),
                const SeeMoreView(child: Text(Consts.bigText)),
                const Divider(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Expanded Views: ',
                    style: TextStyle(fontSize: 20, color: UIThemeColors.text1),
                  ),
                ),
                ExpandedView.label(
                  'Expanded View',
                  buildBody: (context) => const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(Consts.bigText),
                  ),
                ),
                ExpandedView.label(
                  'Expanded View (With Sessions)',
                  sessionsName: 'test',
                  buildBody: (context) => const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(Consts.bigText),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
