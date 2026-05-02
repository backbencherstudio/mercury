import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mercury/core/constansts/color_manger.dart';
import 'package:mercury/core/resource/style_manager.dart';
import '../../../core/constansts/icon_manager.dart';
import '../../../core/route/route_name.dart';
import '../../widgets/custom_back_header.dart';
import '../../widgets/primary_button.dart';

class AvailableScreen extends StatelessWidget {
  const AvailableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              CustomBackHeader(title: "Available!"),
              Spacer(),
              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: ColorManager.backgroundLight,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  IconManager.like,
                  height: 32.h,
                  width: 32.w,
                ),
              ),

              20.verticalSpace,

              Text(
                "Done!",
                style: getSemiBold600Style24(color: ColorManager.black500),
              ),

              20.verticalSpace,
              Text(
                textAlign: TextAlign.center,
                "A representative may contract you\nto request contact information",
                style: getRegular400Style16(
                  color: ColorManager.black400,
                  height: 1.3,
                ),
              ),

              20.verticalSpace,

              PrimaryButton(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.bottomNavScreen);
                },
                title: 'Back To Home',
                width: 270.w,
              ),
              Spacer(),
              80.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
