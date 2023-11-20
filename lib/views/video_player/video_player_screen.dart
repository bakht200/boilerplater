import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:tentwenty_movie_project/arguments/video_player_arguments.dart';
import 'package:tentwenty_movie_project/constant/app_theme.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String movieId;
  VideoPlayerScreen({required this.movieId});
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        loop: false,
      ),
    );

    _controller.listen((event) {
      if (event.playerState == PlayerState.ended) {
        OneContext().pop();
      }
    });

    _controller.loadVideoByUrl(
        mediaContentUrl: "https://www.youtube.com/embed/${widget.movieId}");
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      autoFullScreen: true,
      controller: _controller,
      builder: (context, player) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                OneContext().pop();
              },
              child: Icon(
                Icons.navigate_before,
                color: Colors.black,
              ),
            ),
            elevation: 0,
            backgroundColor: AppColors.backgroundColor,
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return ListView(
                children: [
                  player,
                  VideoPositionIndicator(),
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}

class VideoPositionIndicator extends StatelessWidget {
  ///

  @override
  Widget build(BuildContext context) {
    final controller = context.ytController;

    return StreamBuilder<YoutubeVideoState>(
      stream: controller.videoStateStream,
      initialData: const YoutubeVideoState(),
      builder: (context, snapshot) {
        final position = snapshot.data?.position.inMilliseconds ?? 0;
        final duration = controller.metadata.duration.inMilliseconds;

        return LinearProgressIndicator(
          value: duration == 0 ? 0 : position / duration,
          minHeight: 1,
        );
      },
    );
  }
}

///
