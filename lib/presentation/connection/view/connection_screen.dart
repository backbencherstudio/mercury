import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mercury/core/constansts/color_manger.dart';
import 'package:mercury/core/resource/style_manager.dart';
import 'package:mercury/presentation/widgets/custom_back_header.dart';
import '../../../core/constansts/icon_manager.dart';
import '../../../core/resource/utils.dart';
import '../../../core/route/route_name.dart';
import '../../bottom_nav/viewmodel/bottom_nav_provider.dart';
import '../viewmodel/connection_request_viewmodel.dart';

class ConnectionScreen extends ConsumerStatefulWidget {
  const ConnectionScreen({super.key});

  @override
  ConsumerState<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends ConsumerState<ConnectionScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(connectionRequestProvider.notifier).getConnectionRequest();
    });
  }

  @override
  Widget build(BuildContext context) {
    final connectionRequest = ref.watch(connectionRequestProvider);
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
                child: RefreshIndicator(
                  onRefresh: () async {
                    await ref
                        .read(connectionRequestProvider.notifier)
                        .getConnectionRequest();
                  },
                  child: ListView.builder(
                    itemCount: connectionRequest.length,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final connectData = connectionRequest[index]!;
                      return GestureDetector(
                        onTap: () {
                          if (connectData.status != "FULFILLED") {
                            Navigator.pushNamed(
                              context,
                              RouteName.connectionRequestScreen,
                              arguments: {'id': connectData.id},
                            );
                          } else {
                            Utils.showToast(
                              message: 'Request already fulfilled',
                              backgroundColor: ColorManager.backgroundColor,
                              textColor: ColorManager.whiteColor,
                            );
                          }
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
                                      connectData.trade ?? "",
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
                                        color: connectData.status == "FULFILLED"
                                            ? ColorManager.backgroundPressed
                                            : ColorManager.backgroundLight,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        connectData.status ?? "",
                                        style: getRegular400Style12(
                                          color:
                                              connectData.status == "FULFILLED"
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
                                      connectData.location ?? "",
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
                                      Utils.calculateTimeAgo(
                                        connectData.timeAgo ?? '',
                                      ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
