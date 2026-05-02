import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mercury/core/constansts/color_manger.dart';
import 'package:mercury/core/constansts/icon_manager.dart';
import 'package:mercury/core/resource/style_manager.dart';
import 'package:mercury/presentation/widgets/primary_button.dart';

import '../../widgets/custom_back_header.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key});

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
                              value: "123 Main St, Los Angeles",
                              icon: IconManager.map,
                              onEdit: () {},
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Divider(color: ColorManager.black50),
                            ),

                            PreviewInfo(
                              title: "Homeowner's Name",
                              value: "John Smith",
                              icon: IconManager.user,
                              onEdit: () {},
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Divider(color: ColorManager.black50),
                            ),

                            PreviewInfo(
                              title: "Homeowner's Phone",
                              value: "+33 01238324",
                              icon: IconManager.calling,
                              onEdit: () {},
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Divider(color: ColorManager.black50),
                            ),

                            PreviewInfo(
                              title: "Trade",
                              value: "Plumbing",
                              icon: IconManager.personPlus,
                              onEdit: () {},
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Divider(color: ColorManager.black50),
                            ),

                            PreviewInfo(
                              title: "Notes",
                              value:
                                  "The lead is located on 123 Main St. The owner’s name is John Smith. He has some roof leaking issue. I’ve shared some images based on specific objective. Please see the images below for this specific lead.",
                              icon: IconManager.personPlus,
                              onEdit: () {},
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Divider(color: ColorManager.black50),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildImageTile("Image1.jpg", "images1.jpg"),
                                _buildImageTile("image.jpg", "image12.jpg"),
                                _buildImageTile("image2.jpg", "image2.jpg"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      20.verticalSpace,
                      PrimaryButton(title: 'Submit', onTap: () {}),
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

  Widget _buildImageTile(String displayName, String fileName) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const Icon(
              CupertinoIcons.photo,
              size: 50,
              color: Colors.grey,
            ), // Replace with real Image.file() later
          ),
        ),
        const SizedBox(height: 6),
        Text(
          displayName,
          style: const TextStyle(fontSize: 13, color: Colors.black87),
          textAlign: TextAlign.center,
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
              onTap: () {},
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
