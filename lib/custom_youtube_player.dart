import 'package:flutter/material.dart';
import 'package:choco_tube/model/video_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomYoutubePlayer extends StatefulWidget {
  final VideoModel videoModel;
  const CustomYoutubePlayer({required this.videoModel, super.key});

  @override
  State<CustomYoutubePlayer> createState() => _CustomYoutubePlayer();
}

class _CustomYoutubePlayer extends State<CustomYoutubePlayer> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
      initialVideoId: widget.videoModel.id,
      flags: const YoutubePlayerFlags(autoPlay: false),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        YoutubePlayer(
          controller: controller,
          showVideoProgressIndicator: true,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            widget.videoModel.title,
            style: const TextStyle(
                fontSize: 16, color: Colors.blue, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
