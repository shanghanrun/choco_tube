import 'package:choco_tube/custom_youtube_player.dart';
import 'package:choco_tube/model/video_model.dart';
import 'package:choco_tube/repository/youtube_repository.dart';
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
        title: const Text(
          '초코튜브',
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
          future: YoutubeRepository.getVideos(), // 퓨처값 가져올 비동기 함수
          builder: (contex, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              print('대기');
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print('에러');
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              print('비었음.');
              return const Center(child: Text('No data'));
            } else {
              return RefreshIndicator(
                onRefresh: () async {
                  setState(() {});
                },
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: snapshot.data!
                      .map((e) => CustomYoutubePlayer(videoModel: e))
                      .toList(),
                ),
              );
            }
          }),
    );
  }
}
