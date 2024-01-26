import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oracle_digital_internship/src/core/utils/models/post.dart';
import 'package:oracle_digital_internship/src/features/initial/data/repositories/initial_repository.dart';

part 'initial_event.dart';
part 'initial_state.dart';

class InitialBloc extends Bloc<InitialEvent, InitialState> {
  InitialBloc(this.initialRepository) : super(InitialInitial()) {
    on<ShowInitialPostEvent>((event, emit) async {
      try {
        emit(InitialLoading());
        final model = await initialRepository.getInitialPost();
        emit(InitialSuccess(model));
      } catch (e, s) {
        emit(InitialError(e, s));
      }
    });
  }
  final IInitialRepository initialRepository;
}
