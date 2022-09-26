import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:note_app/app/core/design/theme.dart';
import 'package:note_app/app/core/utils/controller.dart';
import 'package:note_app/generated/locales.g.dart';

import 'app/data/services/storage/services.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  Get.put<GlobalAppController>(GlobalAppController());
  final globalController = Get.find<GlobalAppController>();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Notes",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      locale: Locale(
        "${globalController.language[0]}",
        "${globalController.language[1]}",
      ),
      translationsKeys: AppTranslation.translations,
    ),
  );
}
