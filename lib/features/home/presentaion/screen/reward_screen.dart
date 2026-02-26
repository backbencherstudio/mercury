import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/route_name.dart';
import '../../../../core/widget/customButton.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Color(0xffE7F9FB),
                shape: BoxShape.circle,
              ),
              child: Image.asset("assets/images/Gift 2 GIF.png", height: 80),
            ),

            SizedBox(height: 10),
            Text(
              "You've Received A Gift!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 10),
            Text("Click the button to see what's inside the gift"),

            SizedBox(height: 20),

            CustomButton(
              backgroundColor: Color(0xff0F9DAB),
              textColor: Colors.white,
              text: "See What's inside",
              submit: () {
                Navigator.pushNamed(context, RouteNames.rewardDetails);

              },
            ),
          ],
        ),
      ),
    );
  }
}
