import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funny_app/common/components/buttons/custom_button.dart';
import 'package:funny_app/common/components/custom_appbar.dart';
import 'package:funny_app/common/constants/app_color.dart';
import 'package:funny_app/common/string_manager/string_manager.dart';
import 'package:funny_app/features/funny_screen/presentations/bloc/funny_bloc.dart';
import 'package:funny_app/models/joke_content_model.dart';

class FunnyWidget extends StatelessWidget {
  const FunnyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Scaffold(
        backgroundColor: AppColor.white,
        appBar: const CustomAppbar(),
        body: Column(
          children: [
            _buildTopBody(context),
            _buildCenterBody(context),
            _buildBottomBody(context)
          ],
        ),
      ),
    );
  }

  Widget _buildTopBody(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: AppColor.lightGreen,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              StringManager.headerBodyTitle,
              style: TextStyle(color: AppColor.white, fontSize: 40.sp),
            ),
            const SizedBox(height: 23.0),
            Text(
              StringManager.headerBodySubTitle,
              style: TextStyle(color: AppColor.white, fontSize: 27.sp),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCenterBody(BuildContext context) {
    return BlocBuilder<FunnyBloc, FunnyState>(
      builder: (context, state) {
        return Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 90.0.h),
            width: MediaQuery.of(context).size.width,
            color: AppColor.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  state.jokeContentModel?.jokeContent ?? StringManager.message,
                  style: TextStyle(color: AppColor.grey, fontSize: 33.0.sp),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                      title: 'This is Funny!',
                      onPressed: () => context.read<FunnyBloc>().add(
                          OnTapFunnyEvent(state.jokeContentModel!.id, true)),
                    ),
                    CustomButton(
                      title: 'This is not Funny!',
                      backgroundColor: AppColor.lightGreen,
                      onPressed: () => context.read<FunnyBloc>().add(
                          OnTapFunnyEvent(state.jokeContentModel!.id, false)),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomBody(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 11.0, vertical: 12.0.h),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: AppColor.lightGrey),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              textAlign: TextAlign.center,
              StringManager.botomContent,
              style: TextStyle(color: AppColor.grey, fontSize: 25.0.sp),
            ),
            Text(
              StringManager.copyRight,
              style: TextStyle(color: AppColor.grey, fontSize: 32.0.sp),
            ),
          ],
        ),
      ),
    );
  }
}
