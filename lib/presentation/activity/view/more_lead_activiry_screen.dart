import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mercury/core/constansts/color_manger.dart';
import 'package:mercury/core/resource/style_manager.dart';

import '../../widgets/custom_back_header.dart';
import '../model/more_lead_model.dart';

class MoreLeadActivityScreen extends StatelessWidget {
  const MoreLeadActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        "Total Lead submitted (${totalLeadList.length})",
                      ),
                      const SizedBox(height: 10),
                      _leadCard(totalLeadList),

                      const SizedBox(height: 20),

                      _sectionTitle(
                        "Qualified Leads (${qualifiedLeadList.length})",
                      ),
                      const SizedBox(height: 10),
                      _leadCard(qualifiedLeadList),

                      const SizedBox(height: 20),

                      _sectionTitle(
                        "Conversions (${conversationLeadList.length})",
                      ),
                      const SizedBox(height: 10),
                      _leadCard(conversationLeadList),
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

  Widget _leadCard(List<MoreLeadModel> leadList) {
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

  Widget _leadRow(MoreLeadModel lead) {
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lead.title,
                style: getRegular400Style14(color: ColorManager.black500),
              ),
              2.verticalSpace,
              Text(
                lead.subtext,
                style: getRegular400Style14(color: ColorManager.black400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
