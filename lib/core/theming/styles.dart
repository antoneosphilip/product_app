import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products_app/core/theming/colors.dart';

import 'font_weight_helper.dart';

class TextStyles {
  static TextStyle font21BlackSemiBold = TextStyle(
    fontSize: 21.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.black,
  );
  static TextStyle font14WhiteRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.white,
  );
  static TextStyle font14BlackBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.extraExtraBold,
    color: Colors.black,
  );
  static TextStyle font14BurbleBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.mainBurble,
  );
  static TextStyle font12WhiteRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
  );
  static TextStyle font8WhiteSemiBold = TextStyle(
    fontSize: 8.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white,
  );
  static TextStyle font15WhiteRegular = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
  );
  static TextStyle font12GreyLight = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.thin,
    color: Colors.white,
  );

  static TextStyle font18WhiteBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.extraBold,
    color: Colors.white,
  );
  static TextStyle font19WhiteBold = TextStyle(
    fontSize: 19.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.white,
  );
  static TextStyle font24WhiteExtraBold= TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.extraBold,
    color: Colors.white,
  );
  static TextStyle font24ExtraBold= TextStyle(
    color: ColorsManager.colorSecondry,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    height: 1.2.h,
  );
  static TextStyle font20ExtraBold= TextStyle(
    color: ColorsManager.colorSecondry,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font16Regular= TextStyle(
      fontSize: 16,
      height: 1.5,
      color: ColorsManager.colorSecondry.withOpacity(0.8)
  );
  static TextStyle font32WhiteInter = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w800,
    color: Colors.white,
  );
  static TextStyle font16WhiteInter = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.extraExtraBold,
    color: Colors.white,
  );

}
