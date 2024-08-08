import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funny_app/common/constants/app_color.dart';
import 'package:funny_app/common/constants/app_style.dart';
import 'package:funny_app/common/string_manager/string_manager.dart';
import 'package:funny_app/gen/assets.gen.dart';
import 'package:funny_app/models/user_model.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.h),
      color: AppColor.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.icons.logo, width: 70.0.w),
          const Spacer(),
          RichText(
            textAlign: TextAlign.end,
            text: TextSpan(
              children: [
                TextSpan(
                    text: StringManager.handleCrafted,
                    style: AppStyle.nameTitleStyle),
                TextSpan(
                    text: '\n${userModel.name}', style: AppStyle.nameStyle),
              ],
            ),
          ),
          const SizedBox(width: 10.0),
          CircleAvatar(
            radius: 35.0.w,
            backgroundImage: NetworkImage(userModel.avatarPath),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 120.0);
}
