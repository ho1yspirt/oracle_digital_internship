// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:oracle_digital_internship/src/features/auth/data/datasources/auth_datasource.dart';
import 'package:oracle_digital_internship/src/features/auth/data/models/auth_response.dart';
import 'package:oracle_digital_internship/src/features/auth/data/models/signup_response.dart';
import 'package:oracle_digital_internship/src/features/auth/data/repositories/auth_repository.dart';

class MockAuthRepository implements IAuthRepository {
  MockAuthRepository(this.authDataSource);

  final IAuthDataSource authDataSource;

  @override
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final Response response = await authDataSource.login(
        email: email,
        password: password,
      );
      return const AuthResponseModel(apiToken: '-', refreshToken: '-');
    } catch (e, s) {
      throw FormatException(e.toString(), s);
    }
  }

  @override
  Future<AuthResponseModel> refreshToken({
    required String refreshToken,
  }) async {
    try {
      final Response response = await authDataSource.refreshToken(
        refreshToken: refreshToken,
      );
      return const AuthResponseModel(apiToken: '-', refreshToken: '-');
    } catch (e, s) {
      throw FormatException(e.toString(), s);
    }
  }

  @override
  Future<SignupResponseModel> signup({
    required String email,
    required String password,
  }) async {
    try {
      final Response response = await authDataSource.signup(
        email: email,
        password: password,
      );
      return const SignupResponseModel(apiToken: '-');
    } catch (e, s) {
      throw FormatException(e.toString(), s);
    }
  }

  @override
  Future<AuthResponseModel> signupConfirm({
    required String nickname,
  }) async {
    try {
      final Response response = await authDataSource.signupConfirm(
        nickname: nickname,
      );
      return const AuthResponseModel(apiToken: '-', refreshToken: '-');
    } catch (e, s) {
      throw FormatException(e.toString(), s);
    }
  }
}
