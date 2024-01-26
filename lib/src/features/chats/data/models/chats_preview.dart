import 'dart:convert';

import 'package:equatable/equatable.dart';

class ChatPreviewResponseModel extends Equatable {
  final String id;
  final String username;
  final String avatarImageUrl;
  final String lastMessage;

  const ChatPreviewResponseModel({
    required this.id,
    required this.username,
    required this.avatarImageUrl,
    required this.lastMessage,
  });

  ChatPreviewResponseModel copyWith({
    String? id,
    String? username,
    String? avatarImageUrl,
    String? lastMessage,
  }) =>
      ChatPreviewResponseModel(
        id: id ?? this.id,
        username: username ?? this.username,
        avatarImageUrl: avatarImageUrl ?? this.avatarImageUrl,
        lastMessage: lastMessage ?? this.lastMessage,
      );

  factory ChatPreviewResponseModel.fromRawJson(String str) =>
      ChatPreviewResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChatPreviewResponseModel.fromJson(Map<String, dynamic> json) =>
      ChatPreviewResponseModel(
        id: json["id"],
        username: json["username"],
        avatarImageUrl: json["avatarImageUrl"],
        lastMessage: json["last_message"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "avatarImageUrl": avatarImageUrl,
        "last_message": lastMessage,
      };

  @override
  List<Object?> get props => [id, username, avatarImageUrl, lastMessage];
}
