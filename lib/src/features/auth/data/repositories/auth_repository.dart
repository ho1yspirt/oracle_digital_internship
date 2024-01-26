import 'package:dio/dio.dart';
import 'package:oracle_digital_internship/src/features/auth/data/datasources/auth_datasource.dart';
import 'package:oracle_digital_internship/src/features/auth/data/models/auth_response.dart';
import 'package:oracle_digital_internship/src/features/auth/data/models/signup_response.dart';

abstract interface class IAuthRepository {
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  });

  Future<SignupResponseModel> signup({
    required String email,
    required String password,
  });

  Future<AuthResponseModel> signupConfirm({
    required String nickname,
  });

  Future<AuthResponseModel> refreshToken({
    required String refreshToken,
  });
}

class AuthRepository implements IAuthRepository {
  AuthRepository(this.authDataSource);

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
      return AuthResponseModel.fromJson(response.data);
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
      return AuthResponseModel.fromJson(response.data);
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
      return SignupResponseModel.fromJson(response.data);
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
      return AuthResponseModel.fromJson(response.data);
    } catch (e, s) {
      throw FormatException(e.toString(), s);
    }
  }
}
