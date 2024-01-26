import 'dart:convert';

import 'package:equatable/equatable.dart';

class PostResponseModel extends Equatable {
  final String id;
  final String username;
  final String nickname;
  final String imageUrl;
  final String avatarImageUrl;

  const PostResponseModel({
    required this.id,
    required this.username,
    required this.nickname,
    required this.imageUrl,
    required this.avatarImageUrl,
  });

  PostResponseModel copyWith({
    String? id,
    String? username,
    String? nickname,
    String? imageUrl,
    String? avatarImageUrl,
  }) =>
      PostResponseModel(
        id: id ?? this.id,
        username: username ?? this.username,
        nickname: nickname ?? this.nickname,
        imageUrl: imageUrl ?? this.imageUrl,
        avatarImageUrl: avatarImageUrl ?? this.avatarImageUrl,
      );

  factory PostResponseModel.fromRawJson(String str) =>
      PostResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PostResponseModel.fromJson(Map<String, dynamic> json) =>
      PostResponseModel(
        id: json["id"],
        username: json["username"] ?? "",
        nickname: json["nickname"],
        imageUrl: json["imageUrl"],
        avatarImageUrl: json["avatarImageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "nickname": nickname,
        "imageUrl": imageUrl,
        "avatarImageUrl": avatarImageUrl,
      };

  @override
  List<Object?> get props => [
        id,
        username,
        nickname,
        imageUrl,
        avatarImageUrl,
      ];
}
