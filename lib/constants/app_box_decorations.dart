import 'package:flutter/material.dart';
import 'package:mvvmgetxcase/constants/app_colors.dart';

class AppBoxDecorations {
  static BoxDecoration appCardTitleDecoration = BoxDecoration(
      color: AppColors.primaryColor,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)));
}
