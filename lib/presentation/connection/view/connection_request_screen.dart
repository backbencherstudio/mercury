import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mercury/core/constansts/color_manger.dart';
import 'package:mercury/core/resource/style_manager.dart';
import 'package:mercury/presentation/widgets/custom_back_header.dart';
import 'package:mercury/presentation/widgets/primary_button.dart';
import '../../../core/constansts/icon_manager.dart';
import '../../../core/route/route_name.dart';

class ConnectionRequestScreen extends StatelessWidget {
  const ConnectionRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomBackHeader(title: 'Connection Request'),
              30.verticalSpace,
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ColorManager.backgroundDisabled,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.r),
                          decoration: BoxDecoration(
                            color: ColorManager.backgroundLight,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: SvgPicture.asset(
                            IconManager.setting,
                            height: 24.h,
                            width: 24.w,
                            colorFilter: ColorFilter.mode(
                              ColorManager.primary,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        16.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Required Trade / Specialty",
                              style: getRegular400Style14(
                                color: ColorManager.black400,
                              ),
                            ),
                            6.verticalSpace,
                            Text(
                              "Plumber",
                              style: getMedium500Style16(
                                color: ColorManager.black500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    20.verticalSpace,
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.r),
                          decoration: BoxDecoration(
                            color: ColorManager.backgroundLight,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: SvgPicture.asset(
                            IconManager.location,
                            height: 24.h,
                            width: 24.w,
                            colorFilter: ColorFilter.mode(
                              ColorManager.primary,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        16.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "City / Location",
                              style: getRegular400Style14(
                                color: ColorManager.black400,
                              ),
                            ),
                            6.verticalSpace,
                            Text(
                              "Miami Fl",
                              style: getMedium500Style16(
                                color: ColorManager.black500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    20.verticalSpace,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          IconManager.clock,
                          height: 14.h,
                          width: 14.w,
                          colorFilter: ColorFilter.mode(
                            ColorManager.black400,
                            BlendMode.srcIn,
                          ),
                        ),
                        4.horizontalSpace,
                        Text(
                          "2 hours ago",
                          style: getRegular400Style14(
                            color: ColorManager.black400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              16.verticalSpace,
              Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: ColorManager.backgroundDisabled,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          IconManager.personPlus,
                          height: 24.h,
                          width: 24.w,
                          colorFilter: ColorFilter.mode(
                            ColorManager.black400,
                            BlendMode.srcIn,
                          ),
                        ),
                        4.horizontalSpace,
                        Text(
                          "Do you know a contractor ?",
                          style: getMedium500Style16(
                            color: ColorManager.black500,
                            height: 1.5.h,
                          ),
                        ),
                      ],
                    ),
                    12.verticalSpace,
                    Text(
                      "If you know a contractor for this type of work, let us\nknow. Onjly one referral will be approved per request",
                      style: getRegular400Style14(
                        color: ColorManager.black400,
                        height: 1.5.h,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60.h),
              PrimaryButton(
                title: 'I Know Someone',
                onTap: () {
                  Navigator.pushNamed(context, RouteName.availableScreen);
                },
              ),

              SizedBox(height: 20),
              PrimaryButton(
                title: "I Don't know Someone",
                containerColor: ColorManager.whiteColor,
                border: Border.all(color: ColorManager.primary),
                textStyle: getSemiBold600Style16(color: ColorManager.primary),
                onTap: () {
                  Navigator.pushNamed(context, RouteName.fullfilledScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
