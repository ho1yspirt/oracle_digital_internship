import 'package:dio/dio.dart';
import 'package:oracle_digital_internship/src/core/components/rest_client/endpoints.dart';
import 'package:oracle_digital_internship/src/core/components/rest_client/rest_client.dart';

abstract interface class IChatsDataSource {
  Future<Response> getAllChats();
  Future<Response> getSingleChat(String id);
}

class ChatsDataSource implements IChatsDataSource {
  const ChatsDataSource(this.appRestClient);

  final IAppRestClient appRestClient;

  @override
  Future<Response> getAllChats() async =>
      await appRestClient.get(Endpoints.chats);

  @override
  Future<Response> getSingleChat(String id) async =>
      await appRestClient.get('${Endpoints.singleChat}$id');
}
