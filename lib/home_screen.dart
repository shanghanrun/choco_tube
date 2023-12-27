import 'package:choco_tube/custom_youtube_player.dart';
import 'package:choco_tube/model/video_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('초코튜브'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: CustomYoutubePlayer(
          videoModel: VideoModel(
        id: '3Ck42C2ZCb8',
        title: '다트 언어 기본기 1시간만에 끝내기',
      )),
    );
  }
}
