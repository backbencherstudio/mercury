import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routes/route_name.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff14C4D6),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.person, size: 40, color: Color(0xff14C4D6)),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "James Clerk,",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      "Profile #AP-12345",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.rewardScreen);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset("assets/images/gift GIF.png"),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: Color(0xff2ECBDB),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Color(0xff50D3E1),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "i",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Text(
                    "Share this Profile Number when contacting\nsupport so we can find your profile",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
