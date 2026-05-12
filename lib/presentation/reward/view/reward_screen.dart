import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mercury/core/constansts/color_manger.dart';
import 'package:mercury/core/resource/style_manager.dart';
import 'package:mercury/presentation/widgets/custom_back_header.dart';
import 'package:mercury/presentation/widgets/primary_button.dart';
import '../../../core/route/route_name.dart';
import '../../../core/resource/utils.dart';
import '../viewmodel/gift_card_viewmodel.dart';

class RewardScreen extends ConsumerStatefulWidget {
  const RewardScreen({super.key});

  @override
  ConsumerState<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends ConsumerState<RewardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(giftCardProvider.notifier).getGiftCardStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final giftCards = ref.watch(giftCardProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomBackHeader(title: 'Reward'),
              20.verticalSpace,
              // Top Existing Section
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
              30.verticalSpace,
              Text(
                "Gift History",
                style: getSemiBold600Style20(
                  color: ColorManager.black500,
                ),
              ),
              15.verticalSpace,
              // Gift Cards List
              Expanded(
                child: giftCards.isEmpty
                    ? Center(
                        child: Text(
                          "No rewards found.",
                          style: getRegular400Style16(
                              color: ColorManager.black400),
                        ),
                      )
                    : ListView.builder(
                        itemCount: giftCards.length,
                        itemBuilder: (context, index) {
                          final card = giftCards[index];
                          return Container(
                            margin: EdgeInsets.only(bottom: 15.h),
                            padding: EdgeInsets.all(16.r),
                            decoration: BoxDecoration(
                              color: ColorManager.whiteColor,
                              border: Border.all(color: ColorManager.black50),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        card?.giftCard?.name ?? "Gift Card",
                                        style: getSemiBold600Style18(
                                            color: ColorManager.primary),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    10.horizontalSpace,
                                    Text(
                                      Utils.calculateTimeAgo(card?.sentAt ?? ""),
                                      style: getRegular400Style12(
                                          color: ColorManager.black400),
                                    ),
                                  ],
                                ),
                                10.verticalSpace,
                                Text(
                                  "User: ${card?.user?.name ?? 'N/A'}",
                                  style: getMedium500Style14(
                                      color: ColorManager.black500),
                                ),
                                4.verticalSpace,
                                Text(
                                  "Email: ${card?.user?.email ?? 'N/A'}",
                                  style: getRegular400Style12(
                                      color: ColorManager.black400),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
