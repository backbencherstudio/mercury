import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mercury/core/constansts/icon_manager.dart';
import 'package:mercury/core/resource/style_manager.dart';
import 'package:mercury/presentation/widgets/custom_back_header.dart';
import 'package:mercury/presentation/widgets/custom_network_image.dart';
import '../../../core/constansts/color_manger.dart';
import '../../../data/models/user_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              CustomBackHeader(
                title: "Profile",
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(24.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: Color(0xffD2D2D5)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              "Your Info",
                              style: getSemiBold600Style16(
                                color: ColorManager.textPrimary,
                              ),
                            ),
                            16.verticalSpace,

                            Stack(
                              children: [
                                CustomNetworkImage(
                                  imageUrl: IconManager.networkProfile,
                                  height: 110.h,
                                  width: 110.w,
                                  borderRadius: 100.r,
                                ),

                                Positioned(
                                  bottom: -2,
                                  right: 2,
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: const BoxDecoration(
                                      color: Color(0xffB5EF9D),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.camera_alt,
                                      size: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            24.verticalSpace,
                            CustomInfo(title: "User Name", value: "Corny Bias"),
                            24.verticalSpace,
                            CustomInfo(
                              title: "Phone No.",
                              value: "+32 1232143",
                            ),
                            24.verticalSpace,
                            CustomInfo(title: "Work at Company", value: "N/A"),
                            24.verticalSpace,
                            CustomInfo(title: "Country", value: "America"),
                            24.verticalSpace,
                            CustomInfo(title: "City", value: "New York"),
                            24.verticalSpace,

                            Text(
                              "Trade",
                              style: getMedium500Style18(
                                color: ColorManager.black500,
                              ),
                            ),
                            SizedBox(height: 6.h),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 14.w,
                                    vertical: 11.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorManager.backgroundLight,
                                    borderRadius: BorderRadius.circular(16.r),
                                    border: Border.all(
                                      color: ColorManager.black100,
                                    ),
                                  ),
                                  child: Text(
                                    "Plumbing",
                                    style: getMedium500Style16(
                                      color: ColorManager.black600,
                                    ),
                                  ),
                                ),

                                6.horizontalSpace,
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 14.w,
                                    vertical: 11.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorManager.backgroundLight,
                                    borderRadius: BorderRadius.circular(16.r),
                                    border: Border.all(
                                      color: ColorManager.black100,
                                    ),
                                  ),
                                  child: Text(
                                    "Electrician",
                                    style: getMedium500Style16(
                                      color: ColorManager.black600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      20.verticalSpace,

                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(24.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: Color(0xffD2D2D5)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your Fee Rate",
                              style: getMedium500Style24(
                                color: ColorManager.textPrimary,
                              ),
                            ),
                            24.verticalSpace,

                            CustomInfo(
                              title: "Qualified Leads Fee",
                              value: "\$ 100",
                            ),
                            24.verticalSpace,
                            CustomInfo(
                              title: "Conversation Fee",
                              value: "\$ 1,500",
                            ),
                          ],
                        ),
                      ),

                      20.verticalSpace,

                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(24.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: Color(0xffD2D2D5)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Other Detail",
                              style: getMedium500Style24(
                                color: ColorManager.textPrimary,
                              ),
                            ),
                            24.verticalSpace,

                            CustomInfo(title: "Total Leads Sent", value: "20"),
                            24.verticalSpace,
                            CustomInfo(
                              title: "Total Gifts Received",
                              value: "10",
                            ),
                            24.verticalSpace,
                            CustomInfo(
                              title: "Total Connection fulfilled By You",
                              value: "4",
                            ),
                          ],
                        ),
                      ),

                      40.verticalSpace,
                    ],
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

class CustomInfo extends StatelessWidget {
  const CustomInfo({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: getMedium500Style18(color: ColorManager.black500)),
        6.verticalSpace,
        Text(value, style: getRegular400Style14(color: ColorManager.black400)),
      ],
    );
  }
}
