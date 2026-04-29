import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mercury/presentation/widgets/custom_button.dart';

import '../../../core_copy/route/route_name.dart';

class SupportCenterScreen extends StatelessWidget {
  const SupportCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Transform.translate(
            offset: Offset(10, 0),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffE9E9EA),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        title: Text(" Support Center"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 90),
            Image.asset("assets/images/support icon.png", height: 100),
            SizedBox(height: 32.h),
            Text(
              "Need help?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 32.h),
            Text(
              "Request a callback from our team and we'll get back to you shortly",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 48.h),
            CustomButton(
              backgroundColor: Color(0xff0E93A1),
              textColor: Colors.white,
              text: "Please Contact Me",
              submit: () {
                Navigator.pushNamed(context, RouteName.supportCenterRequestScreen);
              },
            ),
            SizedBox(height: 8.h),
            Text(
              "Available 24/7 Secure Connection",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
