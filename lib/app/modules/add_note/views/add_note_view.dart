import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:note_app/app/core/widgets/confirm_dialog.dart';
import 'package:note_app/app/core/widgets/icon_button.dart';
import 'package:note_app/app/modules/view_note/controllers/view_note_controller.dart';
import 'package:note_app/app/routes/app_pages.dart';

import '../controllers/add_note_controller.dart';
import '../../../core/utils/extensions.dart';

class AddNoteView extends GetView<AddNoteController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomIconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            if (controller.isSame) {
              Get.find<ViewNoteController>().note.value = controller.lastNote!;
              Get.back();
            } else {
              Get.dialog(
                ConfirmDialog(
                  text: "sure_to_discard".tr,
                  onDiscard: () {
                    Get.find<ViewNoteController>().note.value =
                        controller.lastNote!;
                    controller.clear();
                    Get.back();
                  },
                  onValid: () {},
                  validText: "keep".tr,
                ),
              );
            }
          },
        ),
        actions: [
          CustomIconButton(
            icon: Icon(Icons.visibility_outlined),
            onPressed: () {
              Get.find<ViewNoteController>().note.value =
                  controller.newNote.value;
              Get.find<ViewNoteController>().isUpdate.value = true;
              Get.toNamed(
                Routes.VIEW_NOTE,
                arguments: {"note": controller.newNote.value, "isUpdate": true},
              );
            },
          ),
          CustomIconButton(
            icon: Icon(Icons.save_outlined),
            onPressed: () {
              Get.dialog(
                ConfirmDialog(
                  text: "save_change".tr,
                  onDiscard: () {},
                  onValid: () {
                    controller.save();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(4.0.wp),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                onChanged: (value) {
                  controller.changeTitle();
                },
                cursorColor: Get.theme.textTheme.headline1!.color,
                style: Get.theme.textTheme.headline1,
                controller: controller.titleCtrl,
                decoration: InputDecoration(hintText: "title".tr),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "type_something".tr;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 3.0.wp,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.containCtrl,
                  onChanged: (value) {
                    controller.changeContain();
                  },
                  cursorColor: Get.theme.textTheme.bodyText2!.color,
                  style: Get.theme.textTheme.bodyText2,
                  maxLines: 100,
                  decoration: InputDecoration(hintText: "type_something".tr),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
