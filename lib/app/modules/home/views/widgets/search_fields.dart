import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/extensions.dart';

class SearchField extends StatelessWidget {
  final void Function() onClose;
  final void Function(String value)? onChanged;
  final TextEditingController? controller;
  const SearchField({
    Key? key,
    required this.onClose,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5.0.wp, horizontal: 4.0.wp),
            padding: EdgeInsets.symmetric(vertical: 2.0.wp, horizontal: 4.0.wp),
            decoration: BoxDecoration(
              color: Get.theme.primaryColor,
              borderRadius: BorderRadius.circular(
                20.0.wp,
              ),
            ),
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              cursorColor: Get.theme.textTheme.bodyText2!.color,
              style: Get.theme.textTheme.bodyText2,
              decoration: InputDecoration(
                hintText: "search_title".tr,
                suffixIcon: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    onClose();
                    Get.back();
                  },
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
