import 'package:dio/dio.dart';
import 'package:oracle_digital_internship/src/core/components/rest_client/endpoints.dart';
import 'package:oracle_digital_internship/src/core/components/rest_client/rest_client.dart';

abstract interface class ISearchDataSource {
  Future<Response> searchAll(String value);
}

class SearchDataSource implements ISearchDataSource {
  const SearchDataSource(this.appRestClient);

  final IAppRestClient appRestClient;

  @override
  Future<Response> searchAll(String value) async =>
      await appRestClient.get('${Endpoints.search}?value=$value');
}
