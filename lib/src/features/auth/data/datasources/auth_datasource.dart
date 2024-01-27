import 'package:dio/dio.dart';
import 'package:oracle_digital_internship/src/core/components/rest_client/endpoints.dart';
import 'package:oracle_digital_internship/src/core/components/rest_client/rest_client.dart';

abstract interface class IAuthDataSource {
  Future<Response> login({
    required String email,
    required String password,
  });

  Future<Response> signup({
    required String email,
    required String password,
  });

  Future<Response> signupConfirm({
    required String nickname,
  });

  Future<Response> refreshToken({
    required String refreshToken,
  });
}

class AuthDataSource implements IAuthDataSource {
  const AuthDataSource(this.appRestClient);

  final IAppRestClient appRestClient;

  @override
  Future<Response> login({
    required String email,
    required String password,
  }) async =>
      await appRestClient.post(Endpoints.login, {
        "email": email,
        "password": password,
      });

  @override
  Future<Response> refreshToken({
    required String refreshToken,
  }) async =>
      await appRestClient.post(Endpoints.refreshToken, {
        "refresh_token": refreshToken,
      });

  @override
  Future<Response> signup({
    required String email,
    required String password,
  }) async =>
      await appRestClient.post(Endpoints.signup, {
        "email": email,
        "password": password,
      });

  @override
  Future<Response> signupConfirm({
    required String nickname,
  }) async =>
      await appRestClient.post(Endpoints.signupConfirm, {
        "nickname": nickname,
      });
}
