import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mercury/presentation/widgets/custom_back_header.dart';
import 'widget/video_container.dart';

class WatchVideoScreen extends StatefulWidget {
  const WatchVideoScreen({super.key});
  @override
  State<WatchVideoScreen> createState() => _WatchVideoScreenState();
}

class _WatchVideoScreenState extends State<WatchVideoScreen> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              CustomBackHeader(title: 'Watch Video'),
              20.verticalSpace,
              Expanded(
                child: ListView.separated(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return VideoContainer();
                  },
                  separatorBuilder: (context, index) {
                    return Padding(padding: EdgeInsets.only(bottom: 24.h));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
