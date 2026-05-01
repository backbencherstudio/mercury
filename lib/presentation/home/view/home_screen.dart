import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mercury/core/constansts/color_manger.dart';
import 'package:mercury/core/resource/style_manager.dart';
import '../../../core/constansts/icon_manager.dart';
import '../../../core/route/route_name.dart';
import '../../bottom_nav/viewmodel/bottom_nav_provider.dart';
import '../../widgets/custom_network_image.dart';
import '../model/home_menu_model.dart';
import '../viewmodel/home_screen_provider.dart';
import 'widget/custom_home_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(stateHome);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light, // icons color
        statusBarBrightness: Brightness.dark, // for iOS
      ),
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 16.h,
                bottom: 20.h,
                left: 20.w,
                right: 20.w,
              ),
              decoration: BoxDecoration(
                color: ColorManager.backgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomNetworkImage(
                        imageUrl: IconManager.networkProfile,
                        height: 48.h,
                        width: 48.w,
                        borderRadius: 100.r,
                      ),

                      8.horizontalSpace,
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RouteName.profileScreen);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'James Clerk',
                              style: getRegular400Style18(
                                color: ColorManager.whiteColor,
                              ),
                            ),
                            4.verticalSpace,
                            Text(
                              'Profile #AP-12345',
                              style: getRegular400Style12(
                                color: ColorManager.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RouteName.rewardScreen);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                            color: ColorManager.whiteColor,
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: Image.asset(
                            IconManager.giftBox,
                            height: 24.h,
                            width: 24.w,
                          ),
                        ),
                      ),
                      16.horizontalSpace,
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteName.notificationScreen,
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                            color: ColorManager.whiteColor,
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: Image.asset(
                            IconManager.notification,
                            height: 24.h,
                            width: 24.w,
                            color: ColorManager.backgroundDark,
                          ),
                        ),
                      ),
                    ],
                  ),

                  24.verticalSpace,
                  Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: ColorManager.whiteColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          IconManager.warning,
                          height: 20.h,
                          width: 20.w,
                        ),
                        10.horizontalSpace,
                        Text(
                          "Share this Profile Number when contacting\nsupport so we can find your profile fast.",
                          style: getRegular400Style14(
                            color: ColorManager.whiteColor,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            20.verticalSpace,
            ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: homeMenuList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final menu = homeMenuList[index];
                return GestureDetector(
                  onTap: () {
                    ref.read(stateHome.notifier).state = index;
                    if (index == 0) {
                      ref.read(bottomNavIndexProvider.notifier).setIndex(1);
                    } else if (index == 1) {
                      ref.read(bottomNavIndexProvider.notifier).setIndex(2);
                    } else if (index == 2) {
                      ref.read(bottomNavIndexProvider.notifier).setIndex(3);
                    } else if (index == 3) {
                      Navigator.pushNamed(context, RouteName.watchVideoScreen);
                    }
                  },
                  child: CustomHomeCard(
                    icon: menu.icon,
                    title: menu.title,
                    description: menu.subtitle,
                    isSelected: index == state,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Padding(padding: EdgeInsets.symmetric(vertical: 8.h));
              },
            ),
          ],
        ),

        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 90),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteName.supportCenterScreen);
            },
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Image.asset(
              "assets/images/supporrt.png",
              height: 120.h,
              width: 120.w,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
