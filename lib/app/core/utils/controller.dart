import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/app/data/providers/preferences/provider.dart';

class GlobalAppController extends GetxController {
  final language = <String>[].obs;
  final theme = 0.obs;

  @override
  void onInit() {
    super.onInit();

    language.value = PreferencesProvider.instance.readLanguage;
    theme.value = PreferencesProvider.instance.readTheme;

    ever(theme, (_) {
      PreferencesProvider.instance.writeTheme(theme.value);
    });
    ever(language, (_) {
      PreferencesProvider.instance.writeLanguage(language.toList());
      Get.updateLocale(Locale(language[0], language[1]));
    });
  }
}
