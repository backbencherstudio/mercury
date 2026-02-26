import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RewardDetails extends StatelessWidget {
  const RewardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),

              Center(
                child: Text(
                  "Your Reward is Ready!",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              SizedBox(height: 25.h),

              Container(
                padding: EdgeInsets.all(18.w),
                decoration: BoxDecoration(
                  color: const Color(0xffE7F9FB),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: const Color(0xffBDEAF0)),
                ),
                child: Column(
                  children: [
                    Text(
                      "Thank you for your activity",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                        color: const Color(0xff0F9DAB),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "As a token of appreciation",
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    SizedBox(height: 15.h),

                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      decoration: BoxDecoration(
                        color: const Color(0xff0F9DAB),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Text(
                          "You've received a gift",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 8.h),
                    Text(
                      "(Gift card is good for 30 days)",
                      style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25.h),

              Text(
                "Your Gift cards",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),

              SizedBox(height: 12.h),

              _giftCardItem(
                icon: "assets/images/Burger icon.png",
                title: "DoorDash",
              ),

              SizedBox(height: 10.h),

              _giftCardItem(
                icon: "assets/images/gas icon.png",
                title: "Gas card",
              ),

              SizedBox(height: 20.h),

              Container(
                padding: EdgeInsets.all(14.w),
                decoration: BoxDecoration(
                  color: const Color(0xffE7F9FB),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  "* There is no guaranteed qualification. Gifts are provided at the company’s discretion.Appreciation gifts are discretionary, non-cash incentives. They are not compensation, wages,or guaranteed rewards.Availability and value may vary\n\n"
                  "* Gift card automatically expires after 30 days since Appreciation Reward Box Opened.",
                  style: TextStyle(fontSize: 12.sp, color: Colors.black87),
                ),
              ),

              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _giftCardItem({required String icon, required String title}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: const Color(0xffF6F8FA),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Image.asset(icon, height: 32.h),
          SizedBox(width: 12.w),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
              decoration: TextDecoration.lineThrough,
              decorationThickness: 2,
            ),
          ),
          const Spacer(),
          const Icon(Icons.timer_outlined, size: 16, color: Colors.grey),
          SizedBox(width: 4.w),
          Text(
            "expired 1/2/26",
            style: TextStyle(fontSize: 12.sp, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
