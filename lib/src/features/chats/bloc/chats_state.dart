part of 'chats_bloc.dart';

sealed class ChatsState extends Equatable {
  const ChatsState();

  @override
  List<Object> get props => [];
}

final class ChatsInitial extends ChatsState {
  @override
  List<Object> get props => [];
}

final class ChatsLoading extends ChatsState {
  @override
  List<Object> get props => [];
}

final class AllChatsSuccess extends ChatsState {
  const AllChatsSuccess(this.modelList);

  final List<ChatPreviewResponseModel> modelList;

  @override
  List<Object> get props => [modelList];
}

final class SingleChatSuccess extends ChatsState {
  const SingleChatSuccess(this.model);

  final ChatResponseModel model;

  @override
  List<Object> get props => [model];
}

final class ChatsError extends ChatsState {
  const ChatsError(this.e, this.s);

  final Object e;
  final StackTrace s;
  @override
  List<Object> get props => [];
}
