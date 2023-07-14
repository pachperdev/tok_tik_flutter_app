import '../../domain/datasources/video_posts_datasourse.dart';
import '../../domain/entities/video_post.dart';
import '../../domain/repositories/video_posts_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostsRepository {
  final VideoPostDataSource videoPostDataSource;

  VideoPostsRepositoryImpl({required this.videoPostDataSource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    // TODO: implement getFavoriteVideosByUser
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videoPostDataSource.getTrendingVideosByPage(page);
  }
}
