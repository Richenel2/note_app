import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:note_app/app/core/design/image.dart';
import 'package:note_app/app/core/utils/controller.dart';
import 'package:note_app/app/core/utils/enum.dart';
import 'package:note_app/app/core/widgets/confirm_dialog.dart';
import 'package:note_app/app/core/widgets/icon_button.dart';
import 'package:note_app/app/core/widgets/note_widget.dart';
import 'package:note_app/app/modules/home/views/search_view.dart';
import 'package:note_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';
import '../../../core/utils/extensions.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('notes'.tr),
        actions: [
          CustomIconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Get.bottomSheet(SearchView(), isScrollControlled: true);
            },
          ),
          CustomIconButton(
            icon: Icon(Icons.translate),
            onPressed: () {
              Get.dialog(
                ConfirmDialog(
                  text: "change_language".tr,
                  onDiscard: () {},
                  onValid: () {
                    final ctrl = Get.find<GlobalAppController>();
                    if (ctrl.langue == LanguageEnum.francais) {
                      ctrl.setLanguage(["en", "US"]);
                    } else {
                      ctrl.setLanguage(["fr", "FR"]);
                    }
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Obx(
        () {
          final notes = controller.notes;
          return notes.length == 0
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(),
                    Image.asset(
                      AppImages.empty,
                      width: 80.0.wp,
                    ),
                    SizedBox(
                      height: 3.0.wp,
                    ),
                    Text(
                      'first_note'.tr,
                    ),
                  ],
                )
              : ListView.builder(
                  itemBuilder: (_, index) {
                    final note = controller.notes[index];
                    return NoteWidget(
                      note: note,
                      onDismissed: (_) {
                        controller.deleteNote(note);
                      },
                    );
                  },
                  itemCount: controller.notes.length,
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_NOTE);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
