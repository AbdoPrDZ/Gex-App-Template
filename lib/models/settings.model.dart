import 'package:get/get.dart';
import 'package:storage_database/storage_collection.dart';

import '../services/main.service.dart';
import '../src/src.dart';
import 'models.dart';

class SettingsModel {
  UserModel? user;
  UIThemeMode themeMode;

  SettingsModel(this.user, this.themeMode);

  static MainService get mainService => Get.find();
  static StorageCollection get collection =>
      mainService.storageDatabase.collection('settings');

  static Future init() async {
    await collection.set({});
    Map cData = await collection.get();
    if (cData.isEmpty) await collection.set({'theme': 'Light', 'user': null});
    mainService.settings = await get();
  }

  static Future<SettingsModel> get() async => fromMap(await collection.get());

  static SettingsModel fromMap(Map data) => SettingsModel(
        data['user'] != null ? UserModel.fromMap(data['user']) : null,
        UIThemeMode(data['theme']),
      );

  Future onAuth(UserModel user) {
    this.user = user;
    return save();
  }

  Future setThemeMode(UIThemeMode themeMode) {
    this.themeMode = themeMode;
    Get.forceAppUpdate();
    return save();
  }

  Future logout() {
    user = null;
    return save();
  }

  Future save() => collection.set(map);

  Map<String, dynamic> get map => {
        'user': user?.map,
        'theme': themeMode.mode,
      };
}
