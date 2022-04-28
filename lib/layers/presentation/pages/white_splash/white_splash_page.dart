import 'package:auto_route/annotations.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/layers/presentation/pages/splash/controller/splash_controller.dart';
import 'package:video_player/video_player.dart';

class WhiteSplashPage extends StatefulWidget {
  final void Function() onAnimationEnd;
  const WhiteSplashPage({
    @PathParam('onAnimationEnd') required this.onAnimationEnd,
    Key? key,
  }) : super(key: key);

  @override
  State<WhiteSplashPage> createState() => _WhiteSplashPageState();
}

class _WhiteSplashPageState extends State<WhiteSplashPage> {
  final splashController = findSplashController();

  late VideoPlayerController _videoController;
  ChewieController? _chewieController;
  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future<void> initializePlayer() async {
    _videoController =
        VideoPlayerController.asset('assets/videos/splash_recover.mp4');
    await _videoController.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      autoPlay: true,
      showOptions: false,
      aspectRatio: 9 / 16,
      customControls: Container(),
    );
    splashController.startPeriodicVideoEndCheck(
      _chewieController,
      widget.onAnimationEnd,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _chewieController != null &&
            _chewieController!.videoPlayerController.value.isInitialized
        ? Scaffold(
            backgroundColor: StandardColors.white,
            body: Chewie(
              controller: _chewieController!,
            ),
          )
        : Container();
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
    _chewieController?.dispose();
  }
}
