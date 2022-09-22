import 'package:get/get.dart';
import 'package:note_app/app/core/utils/keys.dart';

import '../../services/storage/services.dart';

class PreferencesProvider {
  final StorageService _storage = Get.find<StorageService>();
  PreferencesProvider._();
  static final _instance = PreferencesProvider._();
  static PreferencesProvider get instance => _instance;

  int get readTheme => _storage.read(AppKeys.theme) as int;
  void writeTheme(int index) {
    _storage.write(AppKeys.theme, index);
  }

  List<String> get readLanguage =>
      (_storage.read(AppKeys.language) as List).map((e) => "$e").toList();
  void writeLanguage(List<String> language) {
    _storage.write(AppKeys.language, language);
  }
}
