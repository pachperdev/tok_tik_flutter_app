import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tok_tik_flutter_app/presentation/widgets/shared/video_scrollable_view.dart';

import '../../providers/discover_provider.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final discoverProvider = context.watch<DiscoverProvider>();

    return Scaffold(
        body: discoverProvider.initialLoding
            ? const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : VideoScrollableView(videos: discoverProvider.videos));
  }
}
