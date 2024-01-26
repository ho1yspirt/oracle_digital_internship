import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oracle_digital_internship/src/features/chats/data/models/chat.dart';
import 'package:oracle_digital_internship/src/features/chats/data/models/chats_preview.dart';
import 'package:oracle_digital_internship/src/features/chats/data/repositories/chats_repository.dart';

part 'chats_event.dart';
part 'chats_state.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  ChatsBloc(this.chatsRepository) : super(ChatsInitial()) {
    on<LoadChatsPageEvent>((event, emit) async {
      try {
        emit(ChatsLoading());
        final modelList = await chatsRepository.getAllChats();
        emit(AllChatsSuccess(modelList));
      } catch (e, s) {
        emit(ChatsError(e, s));
      }
    });

    on<LoadSingleChatPageEvent>((event, emit) async {
      try {
        emit(ChatsLoading());
        final model = await chatsRepository.getSingleChat(event.id);
        emit(SingleChatSuccess(model));
      } catch (e, s) {
        emit(ChatsError(e, s));
      }
    });
  }
  final IChatsRepository chatsRepository;
}
