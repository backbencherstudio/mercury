import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mercury/core/widget/customButton.dart';

import '../../../../core/routes/route_name.dart';

class ConnectionRequest extends StatelessWidget {
  const ConnectionRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          "Connection Request",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xffF8FAFB),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/Work icon.png", height: 43),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Required Trade / Specialty"),
                          Text(
                            "Plumber",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 17),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/location 3 icon.png",
                        height: 43,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("City / Location"),
                          Text(
                            "Miami FI",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 17),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(Icons.access_time_rounded, size: 18),
                      SizedBox(width: 5),
                      Text("2 hours ago", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xffF8FAFB),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.person_add_alt_outlined, size: 35),
                      SizedBox(width: 6),
                      Text(
                        " Do you know a contractor ?",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "If you know a contractor for this type of work, let us know. Onjly one referral will be approved per request",
                  ),
                ],
              ),
            ),

            SizedBox(height: 60.h),

            CustomButton(
              backgroundColor: Color(0xff0F9DAB),
              textColor: Colors.white,
              text: "I Know Someone",
              submit: () {
                Navigator.pushNamed(context, RouteNames.available);
              },
            ),
            SizedBox(height: 20),
            CustomButton(
              backgroundColor: Color(0xffffffff),
              textColor: Color(0xff13C4D6),
              text: "I Don't know Someone",
              submit: () {},
            ),
          ],
        ),
      ),
    );
  }
}
