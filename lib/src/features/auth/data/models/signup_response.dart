import 'dart:convert';

import 'package:equatable/equatable.dart';

final class SignupResponseModel extends Equatable {
  const SignupResponseModel({required this.apiToken});

  final String apiToken;

  factory SignupResponseModel.fromRawJson(String str) =>
      SignupResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      SignupResponseModel(apiToken: json["api_token"]);

  Map<String, dynamic> toJson() => {"api_token": apiToken};

  @override
  List<Object?> get props => [apiToken];
}
