import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constansts/color_manger.dart';
import '../../../../core/constansts/icon_manager.dart';
import '../../../../core/resource/style_manager.dart';

class CustomHomeCard extends StatelessWidget {
  const CustomHomeCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.isSelected,
  });
  final String icon;
  final String title;
  final String description;
  final bool? isSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: ColorManager.backgroundNormal,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: ColorManager.borderColor),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: ColorManager.backgroundLight,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: SvgPicture.asset(
                icon,
                height: 32.h,
                width: 32.w,
                colorFilter: ColorFilter.mode(
                  ColorManager.black500,
                  BlendMode.srcIn,
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: getMedium500Style18(color: ColorManager.black500),
                ),
                6.verticalSpace,
                Text(
                  description,
                  style: getRegular400Style12(color: ColorManager.black400),
                ),
              ],
            ),

            Spacer(),
            SvgPicture.asset(
              IconManager.trendUp,
              height: 20.h,
              width: 20.w,
              colorFilter: ColorFilter.mode(
                ColorManager.black500,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
