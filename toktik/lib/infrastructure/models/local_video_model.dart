import 'package:toktik/domain/entities/video_post.dart';

class LocalVideoModel {
  String name;
  String videoUrl;
  int likes;
  int views;

  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
  });

  factory LocalVideoModel.fromJson(Map<String, dynamic> json) =>
      LocalVideoModel(
        name: json['name'],
        videoUrl: json['videoUrl'],
        likes: json['likes'],
        views: json['views'],
      );

  VideoPost toVideoPostEntity() => VideoPost(
        caption: name,
        videoURL: videoUrl,
        likes: likes,
        views: views,
      );
}
