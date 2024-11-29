import 'package:flutter/material.dart';
import 'package:news_bakry/utils/app_colors.dart';

class Themeing{
 static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25)
      ),
      centerTitle: true,
      iconTheme:IconThemeData(color: AppColors.white,size: 35)
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: AppColors.white
      ),
      titleMedium: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          color: AppColors.black
      )
    )
  );
}