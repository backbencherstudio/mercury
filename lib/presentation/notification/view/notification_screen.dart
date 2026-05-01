import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mercury/core/resource/style_manager.dart';
import 'package:mercury/presentation/widgets/custom_back_header.dart';

import '../../../core/constansts/color_manger.dart';
import '../../../core/constansts/icon_manager.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              CustomBackHeader(
                title: "Notification",
                // rightWidget: GestureDetector(
                //   onTap: () {},
                //   child: Container(
                //     padding: EdgeInsets.all(12.r),
                //     decoration: BoxDecoration(
                //       color: ColorManager.black50,
                //       shape: BoxShape.circle,
                //     ),
                //     child: Icon(
                //       Icons.notifications_none,
                //       size: 24.sp,
                //       color: ColorManager.black500,
                //     ),
                //   ),
                // ),
              ),
              10.verticalSpace,
              Divider(thickness: 1, color: ColorManager.borderColor),
              10.verticalSpace,

              Expanded(
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: SvgPicture.asset(
                        IconManager.activity,
                        height: 48.h,
                        width: 48.w,
                      ),
                      trailing: Container(
                        height: 8.h,
                        width: 8.w,
                        decoration: BoxDecoration(
                          color: ColorManager.errorColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      title: Text(
                        "ANew Connection Request",
                        style: getSemiBold600Style16(
                          color: ColorManager.titleText,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "You have a new connection request. Please check it out!",
                            style: getRegular400Style14(
                              color: ColorManager.subtitleText,
                              height: 1.5,
                            ),
                          ),
                          8.verticalSpace,
                          Text(
                            "10 min ago",
                            style: getRegular400Style14(
                              color: ColorManager.subtitleText,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: Divider(
                        thickness: 1,
                        color: ColorManager.borderColor,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
