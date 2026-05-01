import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mercury/core/constansts/color_manger.dart';
import 'package:mercury/core/resource/style_manager.dart';
import 'package:mercury/presentation/widgets/custom_back_header.dart';
import 'package:mercury/presentation/widgets/primary_button.dart';
import '../../../core/route/route_name.dart';

class RewardScreen extends ConsumerStatefulWidget {
  const RewardScreen({super.key});

  @override
  ConsumerState<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends ConsumerState<RewardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const CustomBackHeader(title: 'Reward'),

              /// 🔥 CENTER FIX
              Expanded(
                child: Column(
                  children: [
                    const Spacer(),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(1),
                          decoration: const BoxDecoration(
                            color: Color(0xffE7F9FB),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            "assets/images/Gift 2 GIF.png",
                            height: 80.h,
                            width: 80.w,
                          ),
                        ),

                        10.verticalSpace,

                        Text(
                          "You've Received A Gift!",
                          style: getSemiBold600Style24(
                            color: ColorManager.black500,
                          ),
                        ),

                        10.verticalSpace,

                        Text(
                          "Click the button to see what's inside the gift",
                          textAlign: TextAlign.center,
                          style: getRegular400Style16(
                            color: ColorManager.black400,
                          ),
                        ),

                        20.verticalSpace,
                        PrimaryButton(
                          title: "See What's inside",
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteName.rewardDetailScreen,
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
