import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mercury/core/constansts/color_manger.dart';
import 'package:mercury/core/resource/style_manager.dart';
import 'package:mercury/presentation/widgets/custom_back_header.dart';
import 'package:mercury/presentation/widgets/primary_button.dart';
import '../../../core/route/route_name.dart';

class SupportCenterScreen extends StatelessWidget {
  const SupportCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              CustomBackHeader(title: 'Support Center'),

              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/support icon.png",
                        height: 130.h,
                        width: 130.w,
                      ),

                      32.verticalSpace,

                      Text(
                        "Need help?",
                        style: getSemiBold600Style24(
                          color: ColorManager.black500,
                        ),
                      ),

                      32.verticalSpace,

                      Text(
                        "Request a callback from our team and we'll get\nback to you shortly",
                        textAlign: TextAlign.center,
                        style: getRegular400Style12(
                          color: ColorManager.black400,
                        ),
                      ),

                      48.verticalSpace,

                      PrimaryButton(
                        title: 'Please Contact Me',
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteName.supportCenterRequestScreen,
                          );
                        },
                      ),

                      12.verticalSpace,

                      Text(
                        "Available 24/7 Secure Connection",
                        style: getRegular400Style12(
                          color: ColorManager.black400,
                        ),
                      ),
                    ],
                  ),
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
