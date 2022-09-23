import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:note_app/app/core/widgets/icon_button.dart';
import 'package:note_app/app/routes/app_pages.dart';
import 'package:simple_rich_text/simple_rich_text.dart';

import '../controllers/view_note_controller.dart';
import '../../../core/utils/extensions.dart';

class ViewNoteView extends GetView<ViewNoteController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final note = controller.note.value;
      return Scaffold(
        appBar: AppBar(
          leading: CustomIconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            if (!controller.isUpdate.value)
              CustomIconButton(
                icon: Icon(Icons.create_outlined),
                onPressed: () {
                  Get.toNamed(Routes.ADD_NOTE, arguments: {"note": note});
                },
              )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(5.0.wp),
          child: ListView(
            children: [
              Text(
                "${note.title}",
                style: Get.theme.textTheme.headline1!.copyWith(
                  color: HexColor.fromHex(note.color),
                  fontFamily: note.font,
                ),
              ),
              SizedBox(
                height: 3.0.wp,
              ),
              SimpleRichText(
                "${note.contain}",
                style: Get.theme.textTheme.bodyText2,
              )
            ],
          ),
        ),
      );
    });
  }
}
