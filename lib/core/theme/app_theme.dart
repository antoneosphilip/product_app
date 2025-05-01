import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products_app/core/theming/colors.dart';
import 'package:products_app/core/theming/styles.dart';

import '../theming/font_weight_helper.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF2D1B2E);

  static final ThemeData appTheme = ThemeData(
      primaryColor: ColorsManager.colorSecondry,
      scaffoldBackgroundColor: ColorsManager.colorSecondry,
      appBarTheme:  const AppBarTheme(
          color: ColorsManager.colorSecondry,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeightHelper.extraBold,
            color: Colors.white,
          )
      )

  );
}
