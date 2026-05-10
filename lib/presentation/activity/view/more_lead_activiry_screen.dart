import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mercury/core/constansts/color_manger.dart';
import 'package:mercury/core/resource/style_manager.dart';

import '../../widgets/custom_back_header.dart';
import '../../../core/resource/utils.dart';
import '../../../data/models/lead_activity_model.dart' as data_model;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodel/lead_activity_viewmodel.dart';

class MoreLeadActivityScreen extends ConsumerWidget {
  const MoreLeadActivityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(leadActivityProvider);
    final activityData = ref.read(leadActivityProvider.notifier).leadActivityData;

    final submittedItems = activityData?.submitted?.items ?? [];
    final qualifiedItems = activityData?.qualified?.items ?? [];
    final conversionItems = activityData?.conversions?.items ?? [];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              CustomBackHeader(title: 'Lead Activity'),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionTitle(
                        "Total Lead submitted (${submittedItems.length})",
                      ),
                      const SizedBox(height: 10),
                      _leadCard(submittedItems),

                      const SizedBox(height: 20),

                      _sectionTitle(
                        "Qualified Leads (${qualifiedItems.length})",
                      ),
                      const SizedBox(height: 10),
                      _leadCard(qualifiedItems),

                      const SizedBox(height: 20),

                      _sectionTitle(
                        "Conversions (${conversionItems.length})",
                      ),
                      const SizedBox(height: 10),
                      _leadCard(conversionItems),
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

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: getMedium500Style18(color: ColorManager.black500),
    );
  }

  Widget _leadCard(List<data_model.Items> leadList) {
    if (leadList.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text("No data found.", style: getRegular400Style14(color: ColorManager.black400)),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorManager.black50),
      ),
      child: Column(
        children: List.generate(
          leadList.length,
          (index) => Column(
            children: [
              _leadRow(leadList[index]),
              if (index != leadList.length - 1)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Divider(color: ColorManager.black50),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _leadRow(data_model.Items lead) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6.r),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorManager.backgroundLight,
            ),
            child: Icon(Icons.star, size: 24.sp, color: ColorManager.primary),
          ),
          10.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lead.address ?? 'No Address',
                  style: getRegular400Style14(color: ColorManager.black500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                2.verticalSpace,
                Text(
                  Utils.calculateTimeAgo(lead.createdAt ?? ''),
                  style: getRegular400Style14(color: ColorManager.black400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
