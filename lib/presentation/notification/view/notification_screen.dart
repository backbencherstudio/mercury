import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mercury/core/resource/style_manager.dart';
import 'package:mercury/core/resource/utils.dart';
import 'package:mercury/presentation/widgets/custom_back_header.dart';

import '../../../core/constansts/color_manger.dart';
import '../../../core/constansts/icon_manager.dart';
import '../viewmodel/notification_viewmodel.dart';

class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({super.key});

  @override
  ConsumerState<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends ConsumerState<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(notificationProvider.notifier).getNotifications();
    });
  }

  @override
  Widget build(BuildContext context) {
    final notifications = ref.watch(notificationProvider);
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
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final notification = notifications[index];
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
                        notification?.notificationEvent?.type ?? "",
                        style: getSemiBold600Style16(
                          color: ColorManager.titleText,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notification?.notificationEvent?.text ?? "",
                            style: getRegular400Style14(
                              color: ColorManager.subtitleText,
                              height: 1.5,
                            ),
                          ),
                          8.verticalSpace,
                          Text(
                            Utils.calculateTimeAgo(
                              notification?.createdAt ?? "",
                            ),
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
