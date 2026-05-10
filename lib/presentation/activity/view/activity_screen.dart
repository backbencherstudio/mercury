import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mercury/core/constansts/color_manger.dart';
import 'package:mercury/core/resource/style_manager.dart';
import 'package:mercury/presentation/widgets/primary_button.dart';
import '../../../core/route/route_name.dart';
import '../../bottom_nav/viewmodel/bottom_nav_provider.dart';
import '../../../core/resource/utils.dart';
import '../../widgets/custom_back_header.dart';
import '../model/lead_activity_model.dart';
import '../viewmodel/lead_activity_viewmodel.dart';

class ActivityScreen extends ConsumerStatefulWidget {
  const ActivityScreen({super.key});

  @override
  ConsumerState<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends ConsumerState<ActivityScreen> {
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  String _formatApiDate(String dateStr, bool isEnd) {
    final parts = dateStr.split('-');
    if (parts.length != 3) return dateStr;
    final day = parts[0].padLeft(2, '0');
    final month = parts[1].padLeft(2, '0');
    final year = parts[2];
    if (isEnd) {
      return "$year-$month-${day}T23:59:59.999Z";
    } else {
      return "$year-$month-${day}T00:00:00.000Z";
    }
  }

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    final firstDay = DateTime(now.year, now.month, 1);
    _startDateController.text =
        "${firstDay.day}-${firstDay.month}-${firstDay.year}";
    _endDateController.text = "${now.day}-${now.month}-${now.year}";

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(leadActivityProvider.notifier)
          .getLeadActivity(
            startDate: _formatApiDate(_startDateController.text, false),
            endDate: _formatApiDate(_endDateController.text, true),
          );
    });
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(leadActivityProvider);
    final activityData = ref
        .read(leadActivityProvider.notifier)
        .leadActivityData;

    final List<LeadActivityModel> displayList = [
      LeadActivityModel(
        number: activityData?.submitted?.count?.toString() ?? "0",
        title: leadActivityList[0].title,
        icon: leadActivityList[0].icon,
      ),
      LeadActivityModel(
        number: activityData?.qualified?.count?.toString() ?? "0",
        title: leadActivityList[1].title,
        icon: leadActivityList[1].icon,
      ),
      LeadActivityModel(
        number: activityData?.conversions?.count?.toString() ?? "0",
        title: leadActivityList[2].title,
        icon: leadActivityList[2].icon,
      ),
    ];
    // final leadActivity = ref.watch(leadActivityProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomBackHeader(
                title: "Lead Activity",
                onBackTap: () {
                  ref.read(bottomNavIndexProvider.notifier).setIndex(0);
                },
              ),
              30.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () =>
                            Utils.selectDate(context, _startDateController),
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: _startDateController,
                            decoration: InputDecoration(
                              hintText: "Start Date",
                              suffixIcon: Icon(Icons.calendar_today, size: 16),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: ColorManager.black50,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: ColorManager.black50,
                                ),
                              ),
                            ),
                            style: getRegular400Style12(
                              color: ColorManager.black500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: GestureDetector(
                        onTap: () =>
                            Utils.selectDate(context, _endDateController),
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: _endDateController,
                            decoration: InputDecoration(
                              hintText: "End Date",
                              suffixIcon: Icon(Icons.calendar_today, size: 16),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: ColorManager.black50,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: ColorManager.black50,
                                ),
                              ),
                            ),
                            style: getRegular400Style12(
                              color: ColorManager.black500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    10.horizontalSpace,
                    InkWell(
                      onTap: () {
                        if (_startDateController.text.isNotEmpty &&
                            _endDateController.text.isNotEmpty) {
                          ref
                              .read(leadActivityProvider.notifier)
                              .getLeadActivity(
                                startDate: _formatApiDate(
                                  _startDateController.text,
                                  false,
                                ),
                                endDate: _formatApiDate(
                                  _endDateController.text,
                                  true,
                                ),
                              );
                        } else {
                          Utils.showErrorToast(
                            message: "Please select start and end date",
                          );
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.refresh,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Row(
                      children: displayList.map((leadData) {
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
                                    style: getRegular400Style12(
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
