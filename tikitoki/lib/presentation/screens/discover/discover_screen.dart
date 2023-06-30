import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tikitoki/presentation/providers/discover_provider.dart';

import '../../widgets/shared/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final discoverProvider = context.watch<DiscoverProvider>();
//  final discoverProvider = context.read<DiscoverProvider>();
// vvvvvv equals vvv
//    final otroProvider = Provider.of<DiscoverProvider>(context, listen: false);

    return Scaffold(
        body: discoverProvider.initialLoading
            ? const Center(child: CircularProgressIndicator( strokeWidth: 2,))
            :  VideoScrollableView(videos: discoverProvider.videos));
  }
}
