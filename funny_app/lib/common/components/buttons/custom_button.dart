import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funny_app/common/constants/app_color.dart';

class CustomButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? foregroundColor;
  final void Function()? onPressed;
  final String title;
  const CustomButton({
    super.key,
    this.backgroundColor,
    this.foregroundColor,
    this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              WidgetStatePropertyAll(backgroundColor ?? AppColor.lightBlue),
          foregroundColor:
              WidgetStatePropertyAll(foregroundColor ?? AppColor.white),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          minimumSize: WidgetStatePropertyAll(
            Size(240.w, 65.0.h),
          ),
        ),
        onPressed: onPressed,
        child: Text(title));
  }
}
