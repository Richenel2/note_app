import 'package:flutter/material.dart';
import 'package:note_app/app/core/design/colors.dart';
import '../utils/extensions.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    fontFamily: "Nunito",
    primarySwatch: AppColors.blackMaterial,
    scaffoldBackgroundColor: AppColors.darkBlack,
    primaryColor: AppColors.darkGrey,
    splashColor: AppColors.darkBlack,
    hintColor: AppColors.white,
    iconTheme: IconThemeData(
      color: AppColors.white,
      size: 25.0.sp,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
          color: AppColors.white,
          fontSize: 40.0.sp,
          fontWeight: FontWeight.w500),
      bodyText1: TextStyle(
        color: AppColors.lightGrey,
        fontSize: 20.0.sp,
      ),
      bodyText2: TextStyle(
        color: AppColors.white,
        fontSize: 20.0.sp,
      ),
      headline2: TextStyle(
          color: AppColors.darkBlack,
          fontSize: 24.0.sp,
          fontWeight: FontWeight.w500),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: false,
      color: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.w500,
        fontSize: 40.0.sp,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: AppColors.darkGrey2,
      ),
      labelStyle: TextStyle(
        color: AppColors.white,
      ),
      iconColor: AppColors.white,
      border: InputBorder.none,
      floatingLabelStyle: TextStyle(color: AppColors.white),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.darkGrey,
      elevation: 5,
    ),
  );
  static final lightTheme = darkTheme.copyWith();
}
