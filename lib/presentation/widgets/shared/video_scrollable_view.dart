import 'package:flutter/material.dart';
import 'package:tok_tik_flutter_app/domain/entities/video_post.dart';
import 'package:tok_tik_flutter_app/presentation/widgets/shared/video_buttons.dart';
import 'package:tok_tik_flutter_app/presentation/widgets/video/fullScreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({
    Key? key,
    required this.videos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];
        return Stack(children: [
          //video player + gradiente
          SizedBox.expand(
            child: FullScreenPlayer(
              caption: videoPost.caption,
              videoUrl: videoPost.videoUrl,
            ),
          ),

          //botones
          Positioned(
            bottom: 40,
            right: 20,
            child: VideoButton(video: videoPost),
          )
        ]);
      },
    );
  }
}
