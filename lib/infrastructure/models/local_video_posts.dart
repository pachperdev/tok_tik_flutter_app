import 'dart:convert';

import 'package:tok_tik_flutter_app/domain/entities/video_post.dart';

class LocalVideoModel {
  final String? name;
  final String? videoUrl;
  final int? likes;
  final int? views;

  LocalVideoModel({
    this.name,
    this.videoUrl,
    this.likes,
    this.views,
  });

  LocalVideoModel copyWith({
    String? name,
    String? videoUrl,
    int? likes,
    int? views,
  }) =>
      LocalVideoModel(
        name: name ?? this.name,
        videoUrl: videoUrl ?? this.videoUrl,
        likes: likes ?? this.likes,
        views: views ?? this.views,
      );

  factory LocalVideoModel.fromRawJson(String str) =>
      LocalVideoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocalVideoModel.fromJson(Map<String, dynamic> json) =>
      LocalVideoModel(
        name: json["name"],
        videoUrl: json["videoUrl"],
        likes: json["likes"],
        views: json["views"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "videoUrl": videoUrl,
        "likes": likes,
        "views": views,
      };

  VideoPost toVideoPostEntity() => VideoPost(
        caption: name ?? '',
        videoUrl: videoUrl ?? '',
        likes: likes ?? 0,
        views: views ?? 0,
      );
}
