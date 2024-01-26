import 'package:dio/dio.dart';
import 'package:oracle_digital_internship/src/core/components/rest_client/endpoints.dart';
import 'package:oracle_digital_internship/src/core/components/rest_client/rest_client.dart';

abstract interface class IProfileDataSource {
  Future<Response> getProfile();

  Future<Response> getProfileImages();
}

class ProfileDataSource implements IProfileDataSource {
  ProfileDataSource(this.appRestClient);

  final IAppRestClient appRestClient;

  @override
  Future<Response> getProfile() async =>
      await appRestClient.get(Endpoints.profile);

  @override
  Future<Response> getProfileImages() async =>
      await appRestClient.get(Endpoints.profileImages);
}
