import 'package:shared_preferences/shared_preferences.dart';

abstract interface class ITokenDataSource {
  String? getApiToken();
  String? getRefreshToken();

  Future<void> setApiToken(String value);
  Future<void> setRefreshToken(String value);

  Future<void> deleteApiToken();
  Future<void> deleteRefreshToken();
}

class TokenDataSource implements ITokenDataSource {
  const TokenDataSource(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  static const apiTokenKey = 'api_token';
  static const refreshTokenKey = 'refresh_token';

  @override
  String? getApiToken() => sharedPreferences.getString(apiTokenKey);

  @override
  String? getRefreshToken() => sharedPreferences.getString(refreshTokenKey);

  @override
  Future<void> setApiToken(String value) async =>
      await sharedPreferences.setString(apiTokenKey, value);

  @override
  Future<void> setRefreshToken(String value) async =>
      await sharedPreferences.setString(refreshTokenKey, value);

  @override
  Future<void> deleteApiToken() async =>
      await sharedPreferences.remove(apiTokenKey);

  @override
  Future<void> deleteRefreshToken() async =>
      await sharedPreferences.remove(refreshTokenKey);
}
