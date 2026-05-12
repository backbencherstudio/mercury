import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mercury/presentation/widgets/custom_back_header.dart';
import '../viewmodel/watch_video_viewmodel.dart';
import 'widgets/video_container.dart';

class WatchVideoScreen extends ConsumerStatefulWidget {
  const WatchVideoScreen({super.key});
  @override
  ConsumerState<WatchVideoScreen> createState() => _WatchVideoScreenState();
}

class _WatchVideoScreenState extends ConsumerState<WatchVideoScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(watchVideoProvider.notifier).getWatchVideo();
    });
  }

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    final watchVideo = ref.watch(watchVideoProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              CustomBackHeader(title: 'Watch Video'),
              20.verticalSpace,
              watchVideo == null
                  ? const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : watchVideo.isEmpty
                      ? const Expanded(
                          child: Center(
                            child: Text("No videos found"),
                          ),
                        )
                      : Expanded(
                          child: ListView.separated(
                            itemCount: watchVideo.length,
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final data = watchVideo[index];
                              return Column(
                                children: [
                                  if (data.tutorialVideoUrl != null)
                                    VideoContainer(
                                      videoUrl: data.tutorialVideoUrl!,
                                      title: 'How to get started',
                                      subtitle: 'Introduction to Agua Lead',
                                      description: 'This video contains on how to use this app. You will find detail direction on this video.',
                                      durationText: 'Tutorial',
                                      unskippableDuration: data.tutorialUnskippableDuration ?? 30,
                                    ),
                                  if (data.tutorialVideoUrl != null && data.meetingVideoUrl != null)
                                    24.verticalSpace,
                                  if (data.meetingVideoUrl != null)
                                    VideoContainer(
                                      videoUrl: data.meetingVideoUrl!,
                                      title: 'How to get started',
                                      subtitle: 'How to do a meeting',
                                      description: "Here's how to do a meeting. Please watch the video completely to understand how to do it.",
                                      durationText: 'Meeting',
                                      unskippableDuration: data.meetingUnskippableDuration ?? 30,
                                    ),
                                ],
                              );
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
