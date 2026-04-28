import 'package:flutter/material.dart';
import '../../../../core/widget/custom_button.dart';

class Available extends StatelessWidget {
  const Available({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
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
        title: const Text(
          "Connection Request",
          style: TextStyle(color: Colors.black),
        ),
      ),
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
              child: Image.asset("assets/images/done icon.png", height: 60),
            ),

            Text(
              "Done !",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 10),
            Text(
              "A representative may contract you\nto request contact information",
            ),

            SizedBox(height: 10),

            CustomButton(
              backgroundColor: Color(0xff0F9DAB),
              textColor: Colors.white,
              text: "Back To Home",
              submit: () {},
            ),
          ],
        ),
      ),
    );
  }
}
