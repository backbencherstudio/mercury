import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mercury/core/constansts/color_manger.dart';
import 'package:mercury/core/constansts/icon_manager.dart';
import 'package:mercury/core/resource/style_manager.dart';
import 'package:mercury/presentation/widgets/primary_button.dart';

import '../../widgets/custom_back_header.dart';
import 'widgets/gift_card.dart';

class RewardDetailScreen extends StatelessWidget {
  const RewardDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              CustomBackHeader(title: 'Your Reward is Ready!'),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25.h),

                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 16.h,
                        ),
                        decoration: BoxDecoration(
                          color: ColorManager.backgroundLight,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: ColorManager.backgroundColor,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Thank you for your activity",
                              style: getSemiBold600Style16(
                                color: ColorManager.primary,
                              ),
                            ),
                            8.verticalSpace,
                            Text(
                              "As a token of appreciation",
                              style: getMedium500Style12(
                                color: ColorManager.black400,
                              ),
                            ),
                            16.verticalSpace,

                            PrimaryButton(
                              title: "You've received a gift",
                              onTap: () {},
                            ),

                            12.verticalSpace,
                            Text(
                              "(Gift card is good for 30 days)",
                              style: getMedium500Style12(
                                color: ColorManager.black300,
                              ),
                            ),
                          ],
                        ),
                      ),

                      32.verticalSpace,

                      Text(
                        "Your Gift cards",
                        style: getMedium500Style18(
                          color: ColorManager.black500,
                        ),
                      ),

                      20.verticalSpace,

                      ListView.separated(
                        itemCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => GiftCard(
                          title: "DoorDash",
                          image: IconManager.food,
                          expiration: "expired 1/2/26",
                        ),
                        separatorBuilder: (context, index) => 12.verticalSpace,
                      ),

                      28.verticalSpace,

                      Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: ColorManager.backgroundLight,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          "* There is no guaranteed qualification. Gifts are provided at the company’s discretion. Appreciation gifts are discretionary, non-cash incentives. They are not compensation, wages,or guaranteed rewards. Availability and value may vary\n\n"
                          "* Gift card automatically expires after 30 days since Appreciation Reward Box Opened.",
                          style: getRegular400Style14(
                            color: ColorManager.black400,
                            height: 1.6.h,
                          ),
                        ),
                      ),

                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
