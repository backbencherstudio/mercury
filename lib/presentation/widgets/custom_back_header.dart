import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constansts/color_manger.dart';
import '../../core/resource/font_manager.dart';
import '../../core/resource/style_manager.dart';

class CustomBackHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBackTap;
  final Widget? rightWidget;

  const CustomBackHeader({
    super.key,
    required this.title,
    this.onBackTap,
    this.rightWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        /// LEFT BACK BUTTON
        Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: onBackTap ?? () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: ColorManager.black50,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.arrow_back, color: Colors.black, size: 24.sp),
            ),
          ),
        ),

        /// CENTER TITLE
        Text(
          title,
          style: getBold700Style18(
            color: ColorManager.black500,
            fontFamily: FontConstants.fontFamily,
            height: 1.2,
          ),
          textAlign: TextAlign.center,
        ),

        /// OPTIONAL RIGHT WIDGET
        if (rightWidget != null)
          Align(alignment: Alignment.centerRight, child: rightWidget!),
      ],
    );
  }
}
