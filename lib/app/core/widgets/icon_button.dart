import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/extensions.dart';

class CustomIconButton extends StatelessWidget {
  final Icon icon;
  final void Function() onPressed;
  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = 11.0.wp;
    return Padding(
      padding: EdgeInsets.all(2.0.wp),
      child: ElevatedButton(
        onPressed: onPressed,
        child: icon,
        style: ElevatedButton.styleFrom(
          primary: Get.theme.primaryColor,
          fixedSize: Size(size, size),
          maximumSize: Size(size, size),
          minimumSize: Size(size, size),
          padding: EdgeInsets.all(0),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.0.wp),
          ),
        ),
      ),
    );
  }
}
