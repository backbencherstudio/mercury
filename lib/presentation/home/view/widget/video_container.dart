import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/constansts/color_manger.dart';
import '../../../../core/constansts/icon_manager.dart';
import '../../../../core/resource/style_manager.dart';

class VideoContainer extends StatefulWidget {
  const VideoContainer({super.key});

  @override
  State<VideoContainer> createState() => _VideoContainerState();
}

class _VideoContainerState extends State<VideoContainer> {
  late VideoPlayerController _videoController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();

    _videoController = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      ),
    );

    _videoController.initialize().then((_) {
      _chewieController = ChewieController(
        videoPlayerController: _videoController,
        autoPlay: false,
        looping: false,
        allowFullScreen: true,
        allowMuting: true,
        showControls: true,
        showOptions: false,
        materialProgressColors: ChewieProgressColors(
          playedColor: const Color(0xFF7ED957),
          handleColor: const Color(0xFF7ED957),
          bufferedColor: Colors.white38,
          backgroundColor: Colors.white24,
        ),
      );

      setState(() {});
    });
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: ColorManager.borderColor),
      ),
      child: Column(
        children: [
          /// 🔥 VIDEO WITH CHEWIE
          Center(
            child: _chewieController != null &&
                    _chewieController!.videoPlayerController.value.isInitialized
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: AspectRatio(
                      aspectRatio:
                          _chewieController!
                              .videoPlayerController
                              .value
                              .aspectRatio,
                      child: Chewie(controller: _chewieController!),
                    ),
                  )
                : SizedBox(
                    height: 180.h,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
          ),

          8.verticalSpace,

          /// 🔹 TITLE + TIME
          Row(
            children: [
              Text(
                'How to get started',
                style: getMedium500Style18(color: ColorManager.black500),
              ),
              const Spacer(),
              SvgPicture.asset(
                IconManager.stopWatch,
                height: 24.h,
                width: 24.w,
              ),
              4.horizontalSpace,
              Text(
                '45 min',
                style: getRegular400Style14(
                  color: ColorManager.black400,
                  height: 1.5,
                ),
              ),
            ],
          ),

          8.verticalSpace,

          /// 🔹 DESCRIPTION BOX
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: ColorManager.backgroundContainer,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: ColorManager.borderColor2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Introduction to Agua Lead',
                  style: getMedium500Style14(
                    color: ColorManager.blueText,
                  ),
                ),
                12.verticalSpace,
                Text(
                  'This video contains on how to use this app. You will find detail direction on this video.',
                  style: getRegular400Style12(
                    color: ColorManager.black400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}