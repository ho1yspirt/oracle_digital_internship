part of 'chats_bloc.dart';

sealed class ChatsEvent extends Equatable {
  const ChatsEvent();

  @override
  List<Object> get props => [];
}

class LoadChatsPageEvent extends ChatsEvent {
  @override
  List<Object> get props => [];
}

class LoadSingleChatPageEvent extends ChatsEvent {
  const LoadSingleChatPageEvent(this.id);

  final String id;

  @override
  List<Object> get props => [];
}
