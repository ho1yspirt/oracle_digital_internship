abstract interface class IAppConfig {
  String get baseUrl;
  String get host;
}

class ProdAppConfig implements IAppConfig {
  @override
  String get baseUrl =>
      'https://my-json-server.typicode.com/ho1yspirt/oracle_digital_internship_db';

  @override
  String get host => 'prod';
}

class DevAppConfig implements IAppConfig {
  @override
  String get baseUrl =>
      'https://my-json-server.typicode.com/ho1yspirt/oracle_digital_internship_db';

  @override
  String get host => 'dev';
}

class TestAppConfig implements IAppConfig {
  @override
  String get baseUrl =>
      'https://my-json-server.typicode.com/ho1yspirt/oracle_digital_internship_db';

  @override
  String get host => 'test';
}
