import 'package:dio/dio.dart';
import 'package:oracle_digital_internship/src/core/components/rest_client/endpoints.dart';
import 'package:oracle_digital_internship/src/core/components/rest_client/rest_client.dart';

abstract interface class IInitialDataSource {
  Future<Response> getInitialPost();
}

class InitialDataSource implements IInitialDataSource {
  InitialDataSource(this.appRestClient);

  final IAppRestClient appRestClient;

  @override
  Future<Response> getInitialPost() async =>
      await appRestClient.get(Endpoints.initialPost);
}
