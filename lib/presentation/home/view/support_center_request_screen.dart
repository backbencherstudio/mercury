import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mercury/core/constansts/icon_manager.dart';
import 'package:mercury/presentation/widgets/custom_back_header.dart';
import 'package:mercury/presentation/widgets/primary_button.dart';
import '../../../core/constansts/color_manger.dart';
import '../../../core/resource/style_manager.dart';
import '../../../core/route/route_name.dart';

class SupportCenterRequestScreen extends StatelessWidget {
  const SupportCenterRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const CustomBackHeader(title: 'Support Center'),
              Expanded(
                child: Column(
                  children: [
                    const Spacer(),
                    Column(
                      children: [
                        SvgPicture.asset(
                          IconManager.circleCheckFilled,
                          height: 146.h,
                          width: 218.w,
                        ),

                        32.verticalSpace,

                        Text(
                          "Request received.\nWe will contact you soon",
                          textAlign: TextAlign.center,
                          style: getSemiBold600Style24(
                            color: ColorManager.black500,
                          ),
                        ),

                        12.verticalSpace,

                        Text(
                          "Our support team will reach out within 24 hours",
                          textAlign: TextAlign.center,
                          style: getRegular400Style12(
                            color: ColorManager.black400,
                          ),
                        ),

                        48.verticalSpace,
                        PrimaryButton(
                          title: 'Back to Home',
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteName.bottomNavScreen,
                            );
                          },
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              80.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
