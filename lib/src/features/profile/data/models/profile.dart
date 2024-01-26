import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProfileResponseModel extends Equatable {
  final String username;
  final String location;
  final String imageUrl;

  const ProfileResponseModel({
    required this.username,
    required this.location,
    required this.imageUrl,
  });

  ProfileResponseModel copyWith({
    String? username,
    String? location,
    String? imageUrl,
  }) =>
      ProfileResponseModel(
        username: username ?? this.username,
        location: location ?? this.location,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  factory ProfileResponseModel.fromRawJson(String str) =>
      ProfileResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      ProfileResponseModel(
        username: json["username"],
        location: json["location"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "location": location,
        "imageUrl": imageUrl,
      };

  @override
  List<Object?> get props => [username, location, imageUrl];
}
