import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mercury/core/constansts/color_manger.dart';
import 'package:mercury/core/constansts/icon_manager.dart';
import 'package:mercury/core/resource/style_manager.dart';
import 'package:mercury/presentation/widgets/primary_button.dart';

import '../../../core/route/route_name.dart';

class AddNewLeadSuccessScreen extends StatefulWidget {
  const AddNewLeadSuccessScreen({super.key});

  @override
  State<AddNewLeadSuccessScreen> createState() =>
      _AddNewLeadSuccessScreenState();
}

class _AddNewLeadSuccessScreenState extends State<AddNewLeadSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(IconManager.success, height: 232.h, width: 232.w),
            20.verticalSpace,
            Text(
              'Done!',
              style: getSemiBold600Style24(color: ColorManager.black500),
            ),
            20.verticalSpace,
            PrimaryButton(
              title: 'Back To Home',
              width: 281.w,
              onTap: () {
                Navigator.pushNamed(context, RouteName.bottomNavScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
