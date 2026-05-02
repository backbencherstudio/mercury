import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mercury/core/constansts/color_manger.dart';
import 'package:mercury/core/constansts/icon_manager.dart';
import 'package:mercury/core/resource/style_manager.dart';
import 'package:mercury/presentation/widgets/custom_button.dart';
import 'package:mercury/presentation/widgets/primary_button.dart';
import '../../../core/route/route_name.dart';
import '../../widgets/custom_back_header.dart';
import '../model/lead_activity_model.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    String? selectedMonth;

    final List<String> months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomBackHeader(title: "Lead Activity"),
              30.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButtonFormField<String>(
                  initialValue: selectedMonth,
                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: ColorManager.iconColor,
                    size: 28,
                  ),
                  items: months.map((month) {
                    return DropdownMenuItem<String>(
                      value: month,
                      child: Text(month),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedMonth = value;
                    });
                  },
                ),
              ),
              20.verticalSpace,
              Row(
                children: leadActivityList.map((leadData) {
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(4.r),
                      child: Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: ColorManager.black50),
                          color: ColorManager.whiteColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.r),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),

                                color: Color(0xffE7F9FB),
                              ),
                              child: SvgPicture.asset(
                                leadData.icon,
                                height: 32.h,
                                width: 32.w,
                              ),
                            ),
                            12.verticalSpace,
                            Text(
                              leadData.number,
                              style: getMedium500Style18(
                                color: ColorManager.black500,
                              ),
                            ),
                            6.verticalSpace,

                            Text(
                              leadData.title,
                              style: getRegular400Style14(
                                color: ColorManager.black500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              20.verticalSpace,
              PrimaryButton(
                title: 'More Info',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteName.moreLeadActivityScreen,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
