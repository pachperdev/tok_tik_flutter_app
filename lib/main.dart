import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tok_tik_flutter_app/presentation/screens/discover/discover_screen.dart';

import 'config/theme/app_theme.dart';
import 'infrastructure/datasources/local_video_datasourse_impl.dart';
import 'infrastructure/repositories/video_posts_repository_impl.dart';
import 'presentation/providers/discover_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostsRepository = VideoPostsRepositoryImpl(
      videoPostDataSource: LocalVideoDataSourceImpl(),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) =>
              DiscoverProvider(videosRepository: videoPostsRepository)
                ..loadNextPage(),
        ),
      ],
      child: MaterialApp(
        title: 'TokTik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
