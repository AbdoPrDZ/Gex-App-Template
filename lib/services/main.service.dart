import 'package:get/get.dart';
import 'package:storage_database/storage_database.dart';

import '../models/models.dart';
import '../utils/utils.dart';

class MainService extends GetxService {
  late StorageDatabase storageDatabase;

  SettingsModel? settings;
  UserModel? get currentUser => settings?.user;
  UIThemeMode get themeMode => settings?.themeMode ?? UIThemeMode.light;

  Future fastInit() async {
    storageDatabase = await StorageDatabase.getInstance();
    // await storageDatabase.clear();
    await SettingsModel.init();
  }

  Future init() async {
    await ViewSessions.init();
    await Future.delayed(const Duration(seconds: 2));
  }
}
