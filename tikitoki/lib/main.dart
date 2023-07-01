import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tikitoki/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:tikitoki/presentation/providers/discover_provider.dart';
import 'package:tikitoki/presentation/screens/discover/discover_screen.dart';

import 'config/theme/app_theme.dart';
import 'infrastructure/datasources/local_video_datasource_impl.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final videoPostRepository = VideoPostsRepositoryImpl(
      videosDatasource: LocalVideosDatasource() );


    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy:false,
          create: (_) => DiscoverProvider(videosRepository: videoPostRepository)..loadNextPage()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        title: 'Tiki-Toki',
        home: const DiscoverScreen(),
      ),
    );
  }
}