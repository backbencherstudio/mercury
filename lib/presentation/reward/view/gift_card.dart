import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constansts/color_manger.dart';
import '../../../core/resource/style_manager.dart';

class GiftCard extends StatelessWidget {
  const GiftCard({
    super.key,
    required this.title,
    required this.image,
    required this.expiration,
  });
  final String title;
  final String image;
  final String expiration;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: ColorManager.backgroundNormal,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset(image, height: 24.h, width: 24.w),
          SizedBox(width: 12.w),
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: ColorManager.black400,
              decoration: TextDecoration.lineThrough,
              decorationThickness: 1.sp,
            ),
          ),
          const Spacer(),
          Icon(Icons.timer_outlined, size: 16.sp, color: ColorManager.black400),
          4.horizontalSpace,
          Text(
            expiration,
            style: getRegular400Style12(color: ColorManager.black400),
          ),
        ],
      ),
    );
  }
}
