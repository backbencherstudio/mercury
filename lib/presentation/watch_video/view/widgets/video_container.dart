import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/constansts/color_manger.dart';
import '../../../../core/constansts/icon_manager.dart';
import '../../../../core/resource/style_manager.dart';

class VideoContainer extends StatefulWidget {
  final String videoUrl;
  final String title;
  final String subtitle;
  final String description;
  final String durationText;
  final int unskippableDuration;

  const VideoContainer({
    super.key,
    required this.videoUrl,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.durationText,
    required this.unskippableDuration,
  });

  @override
  State<VideoContainer> createState() => _VideoContainerState();
}

class _VideoContainerState extends State<VideoContainer> {
  late VideoPlayerController _videoController;
  ChewieController? _chewieController;
  int _maxPlayedSeconds = 0;

  @override
  void initState() {
    super.initState();

    _videoController = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    );

    _videoController.addListener(_videoListener);

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

  void _videoListener() {
    if (!_videoController.value.isInitialized) return;

    final currentPosition = _videoController.value.position.inSeconds;

    // Prevent skipping forward if user hasn't passed the unskippable duration organically
    if (currentPosition > _maxPlayedSeconds + 1) {
      if (_maxPlayedSeconds < widget.unskippableDuration) {
        _videoController.seekTo(Duration(seconds: _maxPlayedSeconds));
        return;
      }
    }

    if (currentPosition > _maxPlayedSeconds) {
      _maxPlayedSeconds = currentPosition;
    }
  }

  @override
  void dispose() {
    _videoController.removeListener(_videoListener);
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
                widget.title,
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
                widget.durationText,
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
                  widget.subtitle,
                  style: getMedium500Style14(
                    color: ColorManager.blueText,
                  ),
                ),
                12.verticalSpace,
                Text(
                  widget.description,
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