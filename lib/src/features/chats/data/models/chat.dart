import 'dart:convert';

import 'package:equatable/equatable.dart';

class ChatResponseModel extends Equatable {
  final String id;
  final String username;
  final String avatarImageUrl;
  final String lastMessage;
  final List<ChatMessage> chat;

  const ChatResponseModel({
    required this.id,
    required this.username,
    required this.avatarImageUrl,
    required this.lastMessage,
    required this.chat,
  });

  ChatResponseModel copyWith({
    String? id,
    String? username,
    String? avatarImageUrl,
    String? lastMessage,
    List<ChatMessage>? chat,
  }) =>
      ChatResponseModel(
        id: id ?? this.id,
        username: username ?? this.username,
        avatarImageUrl: avatarImageUrl ?? this.avatarImageUrl,
        lastMessage: lastMessage ?? this.lastMessage,
        chat: chat ?? this.chat,
      );

  factory ChatResponseModel.fromRawJson(String str) =>
      ChatResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChatResponseModel.fromJson(Map<String, dynamic> json) =>
      ChatResponseModel(
        id: json["id"],
        username: json["username"],
        avatarImageUrl: json["avatarImageUrl"],
        lastMessage: json["last_message"],
        chat: List<ChatMessage>.from(
          json["chat"].map((x) => ChatMessage.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "avatarImageUrl": avatarImageUrl,
        "last_message": lastMessage,
        "chat": List<dynamic>.from(chat.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [id, username, avatarImageUrl, lastMessage, chat];
}

class ChatMessage extends Equatable {
  final String id;
  final bool users;
  final String avatarImageUrl;
  final String message;

  const ChatMessage({
    required this.id,
    required this.users,
    required this.avatarImageUrl,
    required this.message,
  });

  ChatMessage copyWith({
    String? id,
    bool? users,
    String? avatarImageUrl,
    String? message,
  }) =>
      ChatMessage(
        id: id ?? this.id,
        users: users ?? this.users,
        avatarImageUrl: avatarImageUrl ?? this.avatarImageUrl,
        message: message ?? this.message,
      );

  factory ChatMessage.fromRawJson(String str) =>
      ChatMessage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        id: json["id"],
        users: json["users"],
        avatarImageUrl: json["avatarImageUrl"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "users": users,
        "avatarImageUrl": avatarImageUrl,
        "message": message,
      };

  @override
  List<Object?> get props => [id, users, avatarImageUrl, message];
}
