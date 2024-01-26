import 'dart:convert';

import 'package:equatable/equatable.dart';

class PostPreviewResponseModel extends Equatable {
  final String id;
  final String imageUrl;

  const PostPreviewResponseModel({required this.id, required this.imageUrl});

  PostPreviewResponseModel copyWith({String? id, String? imageUrl}) =>
      PostPreviewResponseModel(
          id: id ?? this.id, imageUrl: imageUrl ?? this.imageUrl);

  factory PostPreviewResponseModel.fromRawJson(String str) =>
      PostPreviewResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PostPreviewResponseModel.fromJson(Map<String, dynamic> json) =>
      PostPreviewResponseModel(id: json["id"], imageUrl: json["imageUrl"]);

  Map<String, dynamic> toJson() => {"id": id, "imageUrl": imageUrl};

  @override
  List<Object?> get props => [id, imageUrl];
}
