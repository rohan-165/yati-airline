import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yati_airline/core/constants/app_colors.dart';
import 'package:yati_airline/core/extension/build_context_extension.dart';
import 'package:yati_airline/core/extension/widget_extensions.dart';
import 'package:yati_airline/widget/screen_padding.dart';

class CustomBotton extends StatelessWidget {
  final String? lable;
  final Function() onTap;
  final Color? buttonColor, lableColor, borderColor;
  final double? width;
  const CustomBotton({
    super.key,
    this.lable,
    required this.onTap,
    this.buttonColor,
    this.lableColor,
    this.borderColor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenPadding(
      child: Container(
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: buttonColor ?? AppColors.blackColor,
              border: Border.all(color: borderColor ?? AppColors.blackColor),
            ),
            child: Text(
              lable ?? 'Proceed',
              style: context.textTheme.displayLarge!.copyWith(
                color: lableColor ?? AppColors.whiteColor,
              ),
            ),
          )
          .padHorizontal(horizontal: 20.w)
          .padVertical(vertical: 10.h)
          .onTap(onTap),
    );
  }
}
