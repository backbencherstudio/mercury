import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mercury/core/constansts/color_manger.dart';
import 'package:mercury/core/constansts/icon_manager.dart';
import 'package:mercury/core/resource/style_manager.dart';
import 'package:mercury/presentation/widgets/primary_button.dart';

import 'dart:io';

import '../../widgets/custom_back_header.dart';

class PreviewScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  const PreviewScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              CustomBackHeader(title: 'Preview'),
              SizedBox(height: 20.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: ColorManager.black50),
                        ),
                        padding: EdgeInsets.all(12.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PreviewInfo(
                              title: "Address",
                              value: data['address'] ?? "N/A",
                              icon: IconManager.map,
                              onEdit: () {
                                Navigator.pop(context);
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Divider(color: ColorManager.black50),
                            ),

                            PreviewInfo(
                              title: "Homeowner's Name",
                              value: data['name'] ?? "N/A",
                              icon: IconManager.user,
                              onEdit: () {
                                Navigator.pop(context);
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Divider(color: ColorManager.black50),
                            ),

                            PreviewInfo(
                              title: "Homeowner's Phone",
                              value: data['phone'] ?? "N/A",
                              icon: IconManager.calling,
                              onEdit: () {
                                Navigator.pop(context);
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Divider(color: ColorManager.black50),
                            ),

                            PreviewInfo(
                              title: "Trade",
                              value: data['trade'] ?? "N/A",
                              icon: IconManager.personPlus,
                              onEdit: () {
                                Navigator.pop(context);
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Divider(color: ColorManager.black50),
                            ),

                            PreviewInfo(
                              title: "Notes",
                              value: data['notes'] ?? "N/A",
                              icon: IconManager.personPlus,
                              onEdit: () {
                                Navigator.pop(context);
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Divider(color: ColorManager.black50),
                            ),
                            const SizedBox(height: 12),
                            if (data['files'] != null &&
                                (data['files'] as List).isNotEmpty)
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: (data['files'] as List).length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 10.w,
                                      mainAxisSpacing: 10.h,
                                      childAspectRatio: 1,
                                    ),
                                itemBuilder: (context, index) {
                                  final file =
                                      (data['files'] as List<File>)[index];
                                  return _buildImageTile(
                                    file.path.split('/').last,
                                    file,
                                  );
                                },
                              ),
                          ],
                        ),
                      ),
                      40.verticalSpace,
                      PrimaryButton(
                        title: 'Submit',
                        onTap: () {
                          Navigator.pop(context, true);
                        },
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

  Widget _buildImageTile(String displayName, File file) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(file, fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          displayName,
          style: const TextStyle(fontSize: 13, color: Colors.black87),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class PreviewInfo extends StatelessWidget {
  const PreviewInfo({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.onEdit,
  });
  final String title;
  final String value;
  final String icon;
  final Function onEdit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(icon, height: 20.h, width: 20.w),
            8.horizontalSpace,
            Text(title, style: getMedium500Style16(color: ColorManager.black)),
            Spacer(),
            GestureDetector(
              onTap: () => onEdit(),
              child: SvgPicture.asset(
                IconManager.edit,
                height: 20.h,
                width: 20.w,
              ),
            ),
          ],
        ),
        10.verticalSpace,
        Text(
          value,
          style: getRegular400Style14(
            color: ColorManager.black300,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
