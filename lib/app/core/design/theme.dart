import 'package:flutter/material.dart';
import 'package:note_app/app/core/design/colors.dart';

class AppTheme {
  static final darkTheme =
      ThemeData(fontFamily: "Nunito", splashColor: AppColors.darkBlack);
  static final lightTheme = darkTheme.copyWith();
}
