import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/app/core/design/colors.dart';
import '../utils/extensions.dart';

class ConfirmDialog extends StatelessWidget {
  final String text;
  final void Function() onValid;
  final void Function() onDiscard;
  final String? validText;
  final String? discardText;

  const ConfirmDialog({
    Key? key,
    required this.text,
    required this.onDiscard,
    required this.onValid,
    this.validText,
    this.discardText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(5.0.wp),
          width: 80.0.wp,
          decoration: BoxDecoration(
            color: Get.theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(6.0.wp),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.info,
                color: Get.theme.primaryColor,
                size: 40.0.sp,
              ),
              SizedBox(height: 5.0.wp),
              Text(
                text,
                textAlign: TextAlign.center,
                style: Get.theme.textTheme.bodyText1!,
              ),
              SizedBox(height: 5.0.wp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      onDiscard();
                      Get.back();
                    },
                    child: Text(discardText ?? "button_discard".tr),
                    style: ElevatedButton.styleFrom(primary: AppColors.red),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      onValid();
                      Get.back();
                    },
                    child: Text(validText ?? "button_save".tr),
                    style: ElevatedButton.styleFrom(primary: AppColors.green),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
