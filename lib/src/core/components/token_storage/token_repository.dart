import 'package:oracle_digital_internship/src/core/components/token_storage/token_datasource.dart';
import 'package:oracle_digital_internship/src/features/auth/data/models/auth_response.dart';

abstract interface class ITokenRepository {
  String getApiToken();
  String getRefreshToken();

  Future<void> setTokens(AuthResponseModel model);
  Future<void> setApiToken(String value);

  Future<void> deleteTokens();
}

class TokenRepository implements ITokenRepository {
  const TokenRepository(this.tokenDataSource);

  final ITokenDataSource tokenDataSource;

  @override
  String getApiToken() {
    try {
      final String token;
      token = tokenDataSource.getApiToken() ?? '';
      return token;
    } catch (e, s) {
      throw FormatException(e.toString(), s);
    }
  }

  @override
  String getRefreshToken() {
    try {
      final String token;
      token = tokenDataSource.getRefreshToken() ?? '';
      return token;
    } catch (e, s) {
      throw FormatException(e.toString(), s);
    }
  }

  @override
  Future<void> setTokens(AuthResponseModel model) async {
    try {
      await tokenDataSource.setApiToken(model.apiToken);
      await tokenDataSource.setRefreshToken(model.refreshToken);
    } catch (e, s) {
      throw FormatException(e.toString(), s);
    }
  }

  @override
  Future<void> deleteTokens() async {
    await tokenDataSource.deleteApiToken();
    await tokenDataSource.deleteRefreshToken();
  }

  @override
  Future<void> setApiToken(String value) async {
    try {
      await tokenDataSource.setApiToken(value);
    } catch (e, s) {
      throw FormatException(e.toString(), s);
    }
  }
}
