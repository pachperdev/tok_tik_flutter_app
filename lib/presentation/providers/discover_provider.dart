import 'package:flutter/material.dart';
import 'package:tok_tik_flutter_app/data/local_video_posts.dart';
import 'package:tok_tik_flutter_app/domain/entities/video_post.dart';
import 'package:tok_tik_flutter_app/infrastructure/models/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoding = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    // await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    videos.addAll(newVideos);
    initialLoding = false;

    notifyListeners();
  }
}
