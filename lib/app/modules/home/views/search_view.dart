import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:note_app/app/core/design/image.dart';
import 'package:note_app/app/core/widgets/note_widget.dart';
import 'package:note_app/app/modules/home/controllers/home_controller.dart';
import 'package:note_app/app/modules/home/views/widgets/search_fields.dart';
import '../../../core/utils/extensions.dart';

class SearchView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(top: 10.0.wp),
        color: Get.theme.scaffoldBackgroundColor,
        child: Column(
          children: [
            SearchField(
              onChanged: (value) {
                controller.searchTitle(value);
              },
              controller: controller.searchController,
              onClose: () {
                controller.searchNotes.clear();
                controller.searchController.text = "";
                controller.searchEmpty.value = true;
              },
            ),
            controller.searchNotes.isEmpty
                ? controller.searchEmpty.value
                    ? Container()
                    : Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.search,
                              width: 80.0.wp,
                            ),
                            SizedBox(height: 3.0.wp),
                            Text("file_not_found".tr)
                          ],
                        ),
                      )
                : Flexible(
                    child: ListView.builder(
                      itemBuilder: (_, index) => NoteWidget(
                        note: controller.searchNotes[index],
                      ),
                      itemCount: controller.searchNotes.length,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
