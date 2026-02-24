import 'package:flutter/material.dart';
import 'package:mercury/core/widget/customButton.dart';

import '../../../../core/routes/route_name.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isVideoWatched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6F7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 4,
                      decoration: BoxDecoration(
                        color: const Color(0xff1C8D93),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      height: 4,
                      decoration: BoxDecoration(
                        color: const Color(0xffD9E3E5),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              /// Title
              const Text(
                "Welcome to Agua\nLeads!",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 25),

              Stack(
                children: [
                  Container(
                    height: 190,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.play_arrow,
                        size: 60,
                        color: Colors.white70,
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        "25s",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xffE7F2F3),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xffCDE2E5)),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "First Login Tutorial",
                      style: TextStyle(
                        color: Color(0xff1C8D93),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "This 30–50 second video explains how to use the app.\nYou can skip on future logins.",
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              CustomButton(
                text: "Continue to Setup",
                submit: () {
                  Navigator.pushNamed(context, RouteNames.parentScreen);
                },
                backgroundColor: Color(0xff0E93A1),
                textColor: Colors.white,
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
