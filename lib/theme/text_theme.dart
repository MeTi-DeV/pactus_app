import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pactus_app/theme/app_colors.dart';

ThemeData getAppThemeData() {
  return ThemeData(
    
      inputDecorationTheme: InputDecorationTheme(
        
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: Colors.redAccent.shade400,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: Colors.redAccent.shade400,
            width: 1,
          ),
        ),
        labelStyle: TextStyle(
            color: Colors.grey.shade200,
            fontWeight: FontWeight.w200,
            fontSize: 14),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: AppColors.main_color,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: Colors.grey.shade700,
            width: 1,
          ),
        ),
        
      ),
      textButtonTheme: TextButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: AppColors.white,
            disabledBackgroundColor: AppColors.white,
            surfaceTintColor: AppColors.white,
            foregroundColor: AppColors.white,
            disabledForegroundColor: AppColors.white),
      ),
      textTheme: TextTheme(
        headlineMedium: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 34,
          fontWeight: FontWeight.w500,
        ),
        displayMedium: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 34,
          fontWeight: FontWeight.w500,
        ),
        displaySmall: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 26,
            // fontWeight: FontWeight.bold,
            color: AppColors.white),
        titleLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          color: AppColors.white,
          fontWeight: FontWeight.normal,
        ),
        labelSmall: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 10,
          fontWeight: FontWeight.normal,
        ),
        bodySmall: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: AppColors.grey1),
        labelLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Poppins',
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
      fontFamily: 'Poppins');
}
