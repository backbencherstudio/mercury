import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constansts/color_manger.dart';
import '../../activity/view/activity_screen.dart';
import '../../connection/view/connection_screen.dart';
import '../../home/view/home_screen.dart';
import '../../lead/view/lead_screen.dart';
import '../viewmodel/bottom_nav_provider.dart';

class BottomNavScreen extends ConsumerWidget {
  const BottomNavScreen({super.key});

  static const List<Widget> _screens = [
    HomeScreen(),
    LeadScreen(),
    ActivityScreen(),
    ConnectionScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: currentIndex, children: _screens),

      bottomNavigationBar: Container(
        margin: EdgeInsets.all(16.r),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
              color: ColorManager.shadowColor,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildNavItem(
              icon: "assets/images/home.png",
              title: "Home",
              index: 0,
              currentIndex: currentIndex,
              ref: ref,
            ),
            _buildNavItem(
              icon: "assets/images/lead.png",
              title: "Lead",
              index: 1,
              currentIndex: currentIndex,
              ref: ref,
            ),
            _buildNavItem(
              icon: "assets/images/activity1.png",
              title: "Activity",
              index: 2,
              currentIndex: currentIndex,
              ref: ref,
            ),
            _buildNavItem(
              icon: "assets/images/connection.png",
              title: "Connection",
              index: 3,
              currentIndex: currentIndex,
              ref: ref,
            ),
          ],
        ),
      ),
    );
  }

  /// 🔥 FIXED NAV ITEM (ALL SAME SHAPE)
  Widget _buildNavItem({
    required String icon,
    required String title,
    required int index,
    required int currentIndex,
    required WidgetRef ref,
  }) {
    final isSelected = currentIndex == index;

    final selectedColor = const Color(0xff11BECF);
    final unselectedColor = const Color(0xFF2B4C59);

    return GestureDetector(
      onTap: () {
        ref.read(bottomNavIndexProvider.notifier).setIndex(index);
      },
      behavior: HitTestBehavior.opaque,

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        /// 🔥 SAME SIZE FOR ALL
        width: 90.w,
        height: 55.h,

        decoration: BoxDecoration(
          color: isSelected ? selectedColor : Colors.transparent,
          borderRadius: BorderRadius.circular(18.r),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: 22.h,
              width: 22.w,
              color: isSelected ? Colors.white : unselectedColor,
            ),

            4.verticalSpace,

            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                color: isSelected ? Colors.white : unselectedColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
