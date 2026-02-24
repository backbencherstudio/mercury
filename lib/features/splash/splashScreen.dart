import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/ApiService/TokenStorage.dart';
import '../../core/routes/route_name.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  bool showText = false;

  @override
  void initState() {
    super.initState();

    // Start showing text after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        showText = true;
      });
    });

    Future.delayed(const Duration(seconds: 3), () async {
      final TokenStorage tokenStorage = TokenStorage();
      final String? token = await tokenStorage.getToken();

      if (token != null && token.isNotEmpty) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteNames.loginScreen,
          (route) => false,
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteNames.loginScreen,
          (route) => false,
        );
      }
    });
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
            Image.asset(
              "assets/icons/png/logo.png",
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 20),
            Text(
              "Agua Leads",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 32.sp,
              ),
            ),
            Text(
              "Licensed Contractor Network",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
