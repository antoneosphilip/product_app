import 'package:flutter/material.dart';
import 'package:products_app/core/theming/colors.dart';
import '../theming/font_weight_helper.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF2D1B2E);

  static final ThemeData appTheme = ThemeData(
      primaryColor: ColorsManager.colorPrimary,
      scaffoldBackgroundColor: ColorsManager.colorPrimary,
      appBarTheme:  const AppBarTheme(
          color: ColorsManager.colorPrimary,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeightHelper.extraBold,
            color: Colors.white,
          )
      )

  );
}
