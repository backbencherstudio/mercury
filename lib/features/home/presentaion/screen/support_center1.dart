import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mercury/core/widget/customButton.dart';

class SupportCenter1 extends StatelessWidget {
  const SupportCenter1({super.key});

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
            Image.asset("assets/images/Success.png", height: 130),
            SizedBox(height: 32.h),
            Text(
              "Request received.\nWe will contact you soon",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 32.h),
            Text(
              "Our support team will reach out within 24 hours",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 48.h),
            CustomButton(
              backgroundColor: Color(0xff0E93A1),
              textColor: Colors.white,
              text: "Back to Home",
              submit: () {
                debugPrint("Please Contact Me");
              },
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
