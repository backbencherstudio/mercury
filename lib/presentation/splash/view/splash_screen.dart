import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mercury/core/constansts/color_manger.dart';
import '../../../core/resource/style_manager.dart';
import '../../../core/route/route_name.dart';
import '../../../data/sources/local/shared_preference/shared_preference.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      final token = await SharedPreferenceData.getToken();
      if (token != null && token.isNotEmpty) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, RouteName.bottomNavScreen);
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, RouteName.signInScreen);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff13C4D6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App logo
            Container(
              padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 24.w),
              decoration: BoxDecoration(
                color: ColorManager.whiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'A',
                style: getMedium500Style12(
                  color: ColorManager.backgroundColor,
                  fontSize: 40.sp,
                ),
              ),
            ),

            20.verticalSpace,
            Text(
              "Agua Leads",
              style: getSemiBold600Style32(color: ColorManager.whiteColor),
            ),
            8.verticalSpace,
            Text(
              "Licensed Contractor Network",
              style: getMedium500Style16(color: ColorManager.whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
