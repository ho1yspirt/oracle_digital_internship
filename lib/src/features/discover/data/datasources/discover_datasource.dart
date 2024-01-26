import 'package:dio/dio.dart';
import 'package:oracle_digital_internship/src/core/components/rest_client/endpoints.dart';
import 'package:oracle_digital_internship/src/core/components/rest_client/rest_client.dart';

abstract interface class IDiscoverDataSource {
  Future<Response> getNewToday();

  Future<Response> getBrowseAll();

  Future<Response> getSinglePostPreview(String id);
}

class DiscoverDataSource implements IDiscoverDataSource {
  DiscoverDataSource(this.appRestClient);

  final IAppRestClient appRestClient;

  @override
  Future<Response> getBrowseAll() async =>
      await appRestClient.get(Endpoints.discoverBrowseAll);

  @override
  Future<Response> getNewToday() async =>
      await appRestClient.get(Endpoints.discoverNewToday);

  @override
  Future<Response> getSinglePostPreview(String id) async =>
      await appRestClient.get('${Endpoints.discoverSinglePostPreview}$id');
}
