import 'dart:convert';

import 'package:oracle_digital_internship/src/features/chats/data/datasources/chats_datasource.dart';
import 'package:oracle_digital_internship/src/features/chats/data/models/chat.dart';
import 'package:oracle_digital_internship/src/features/chats/data/models/chats_preview.dart';

abstract interface class IChatsRepository {
  Future<List<ChatPreviewResponseModel>> getAllChats();
  Future<ChatResponseModel> getSingleChat(String id);
}

class ChatsRepository implements IChatsRepository {
  const ChatsRepository(this.chatsDataSource);

  final IChatsDataSource chatsDataSource;

  @override
  Future<List<ChatPreviewResponseModel>> getAllChats() async {
    try {
      final response = await chatsDataSource.getAllChats();
      final List<ChatPreviewResponseModel> result =
          List<ChatPreviewResponseModel>.from(jsonDecode(response.data)
              .map((i) => ChatPreviewResponseModel.fromJson(i)));
      return result;
    } catch (e, s) {
      throw FormatException(e.toString(), s);
    }
  }

  @override
  Future<ChatResponseModel> getSingleChat(String id) async {
    try {
      final response = await chatsDataSource.getSingleChat(id);
      return ChatResponseModel.fromRawJson(response.data);
    } catch (e, s) {
      throw FormatException(e.toString(), s);
    }
  }
}
