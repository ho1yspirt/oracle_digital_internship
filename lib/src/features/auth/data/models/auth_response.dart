import 'dart:convert';

import 'package:equatable/equatable.dart';

final class AuthResponseModel extends Equatable {
  const AuthResponseModel({
    required this.apiToken,
    required this.refreshToken,
  });

  final String apiToken;
  final String refreshToken;

  factory AuthResponseModel.fromRawJson(String str) =>
      AuthResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel(
        apiToken: json["api_token"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "api_token": apiToken,
        "refresh_token": refreshToken,
      };

  @override
  List<Object?> get props => [apiToken, refreshToken];
}
