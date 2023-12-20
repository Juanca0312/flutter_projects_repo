import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/reposotories/video_posts_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostsRepository videoRepository;

  List<VideoPost> videos = [];
  bool initialLoading = true;

  DiscoverProvider({required this.videoRepository});

  Future<void> loadNextPage() async {

    final newVideos = await videoRepository.getTrendingVideosByPage(0);

    videos.addAll(newVideos);
    initialLoading = false;

    notifyListeners();
  }
}
