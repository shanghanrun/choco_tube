import 'package:choco_tube/const/api_const.dart';
import 'package:choco_tube/model/video_model.dart';
import 'package:dio/dio.dart';

class YoutubeRepository {
  static Future<List<VideoModel>> getVideos() async {
    final resp = await Dio().get(
      YOUTUBE_API_URL,
      queryParameters: {
        'channelId': CF_CHANNEL_ID,
        'maxResults': 50,
        'key': API_KEY,
        'part': 'snippet',
        'order': 'date',
      },
    );

    final listWithData = resp.data['items'].where(
      (item) =>
          item?['id']?['videoId'] != null && item?['snippet']?['title'] != null,
    ); // videoId와 title이 null이 아닌 값들만 필터링

    // return listWithData
    //     .map<VideoModel>((item) => VideoModel(
    //         id: item['id']['videoId'], title: item['snippet']['title']))
    //     .toList(); // 이렇게 생성된 VideoModel 리스트를 받음.
    // return listWithData
    // .map<VideoModel>(  // 제네릭으로 했으나, 안해도 된다.
    //   (item)=> VideoModel(id: item['id']['videoId'], title:item['snippet']['title'])
    // ).toList();
    final videoModels = listWithData
        .map((item) => VideoModel(
            id: item['id']['videoId'], title: item['snippet']['title']))
        .toList();
    print('받은 비디오들: $videoModels');
    return videoModels;
  }
}
