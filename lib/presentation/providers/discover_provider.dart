import 'package:flutter/material.dart';
import 'package:tok_tik_flutter_app/domain/repositories/video_posts_repository.dart';
import 'package:tok_tik_flutter_app/domain/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostsRepository videosRepository;

  bool initialLoding = true;
  List<VideoPost> videos = [];

  DiscoverProvider({
    required this.videosRepository,
  });

  Future<void> loadNextPage() async {
    // await Future.delayed(const Duration(seconds: 2));

    // final List<VideoPost> newVideos = videoPosts
    //     .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
    //     .toList();

    final List<VideoPost> newVideos =
        await videosRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoding = false;

    notifyListeners();
  }
}
