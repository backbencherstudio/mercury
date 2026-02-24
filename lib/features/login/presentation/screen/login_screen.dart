import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mercury/core/routes/route_name.dart';
import '../../../../core/widget/CustomTextFIeld.dart';
import '../../../../core/widget/customButton.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Agua Leads",
              style: TextStyle(
                color: Colors.black,
                fontSize: 32.sp,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 8.h),
            Text("Licensed Contactor Network",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 20.h,),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Email",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 4,),

            CustomTextField(hintText: "Enter your email address"),

            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Password",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 4,),
            CustomTextField(
              hintText: "Enter your password",
              isPassword: true,
            ),

            SizedBox(height: 20.h),
            Row(
              children: [
                Checkbox(
                  activeColor: Color(0xff0E93A1),
                  value: true,
                  onChanged: (value) {},
                ),

                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "I agree to the ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: "Terms & Conditions",
                        style: TextStyle(
                          color: Color(0xff13C0D2),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 32.h),
            CustomButton(
              text: "Login",
              submit: () {

                Navigator.pushNamed(context, RouteNames.onboardingScreen);
              },
              backgroundColor: Color(0xff0E93A1),
              textColor: Colors.white,
            ),

            SizedBox(height: 30.h,),
            Text(
              "Forgot password",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff13C0D2),
                decoration: TextDecoration.underline,
                decorationThickness: 2,
                decorationStyle: TextDecorationStyle.solid,
                height: 2,
                decorationColor: Color(0xff13C0D2),
              ),
            ),

            SizedBox(height: 20.h),
            Text("Account are created by Admin Only"),
          ],
        ),
      ),
    );
  }
}
