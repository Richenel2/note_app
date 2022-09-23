import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/app/core/design/colors.dart';
import 'package:note_app/app/core/widgets/confirm_dialog.dart';
import 'package:note_app/app/data/models/note_model.dart';
import 'package:note_app/app/routes/app_pages.dart';
import '../utils/extensions.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  final void Function(DismissDirection)? onDismissed;
  const NoteWidget({Key? key, required this.note, this.onDismissed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.0.wp, vertical: 3.0.wp),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.VIEW_NOTE, arguments: {"note": note});
        },
        child: Dismissible(
          confirmDismiss: (direction) async {
            bool dismiss = false;
            await Get.dialog(
              ConfirmDialog(
                text: "sure_to_delete".tr,
                onDiscard: () {
                  dismiss = true;
                },
                onValid: () {
                  dismiss = false;
                },
                discardText: "delete".tr,
                validText: "keep".tr,
              ),
            );
            return dismiss;
          },
          onDismissed: onDismissed,
          background: Container(
            child: Icon(Icons.delete),
            color: AppColors.red,
          ),
          key: ObjectKey(note),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 7.0.wp, vertical: 5.0.wp),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    "${note.title}",
                    style: Get.theme.textTheme.headline2!
                        .copyWith(fontFamily: note.font),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: HexColor.fromHex(note.color),
              borderRadius: BorderRadius.circular(3.0.wp),
            ),
          ),
        ),
      ),
    );
  }
}
