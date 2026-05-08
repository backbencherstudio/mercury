import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mercury/core/constansts/color_manger.dart';
import 'package:mercury/core/resource/style_manager.dart';
import 'package:mercury/presentation/widgets/custom_back_header.dart';
import '../../../core/constansts/icon_manager.dart';
import '../../../core/route/route_name.dart';
import '../../bottom_nav/viewmodel/bottom_nav_provider.dart';

class ConnectionScreen extends ConsumerStatefulWidget {
  const ConnectionScreen({super.key});

  @override
  ConsumerState<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends ConsumerState<ConnectionScreen> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> data = [
      {
        "title": "Plumber",
        "status": "Open",
        "location": "Miami FI",
        "time": "2 hours ago",
      },
      {
        "title": "Electronics",
        "status": "Open",
        "location": "Fort Lauder dale, FI",
        "time": "5 hours ago",
      },
      {
        "title": "HVAC Technician",
        "status": "Fulfilled",
        "location": "Tampa. FI",
        "time": "6 hours ago",
      },
      {
        "title": "Handyman",
        "status": "Open",
        "location": "Orlando FI",
        "time": "2 hours ago",
      },
      {
        "title": "Roofer",
        "status": "Fulfilled",
        "location": "Jacksonville FI",
        "time": "9 hours ago",
      },
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              CustomBackHeader(
                title: 'Connection Request',
                onBackTap: () {
                  ref.read(bottomNavIndexProvider.notifier).setIndex(0);
                },
              ),
              30.verticalSpace,
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final connectData = data[index];
                    return GestureDetector(
                      onTap: () async {
                        await Navigator.pushNamed(
                          context,
                          RouteName.connectionRequestScreen,
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: ColorManager.backgroundDisabled,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    connectData['title'],
                                    style: getSemiBold600Style20(
                                      color: ColorManager.black500,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 6.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          connectData['status'] == "Fulfilled"
                                          ? ColorManager.backgroundPressed
                                          : ColorManager.backgroundLight,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      connectData['status'],
                                      style: getRegular400Style12(
                                        color:
                                            connectData['status'] == "Fulfilled"
                                            ? ColorManager.black400
                                            : ColorManager.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              12.verticalSpace,
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    IconManager.location,
                                    height: 16.h,
                                    width: 16.w,
                                    colorFilter: ColorFilter.mode(
                                      ColorManager.black400,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  5.horizontalSpace,
                                  Text(
                                    connectData['location'],
                                    style: getRegular400Style12(
                                      color: ColorManager.black400,
                                    ),
                                  ),
                                  20.horizontalSpace,

                                  SvgPicture.asset(
                                    IconManager.clock,
                                    height: 16.h,
                                    width: 16.w,
                                    colorFilter: ColorFilter.mode(
                                      ColorManager.black400,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  5.horizontalSpace,
                                  Text(
                                    connectData['time'],
                                    style: getRegular400Style12(
                                      color: ColorManager.black400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
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
