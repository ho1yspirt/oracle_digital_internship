import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oracle_digital_internship/src/core/utils/models/post.dart';
import 'package:oracle_digital_internship/src/core/utils/models/post_preview.dart';
import 'package:oracle_digital_internship/src/features/discover/data/repositories/discover_repository.dart';

part 'discover_event.dart';
part 'discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  DiscoverBloc(this.discoverRepository) : super(DiscoverInitial()) {
    on<LoadDiscoverPageEvent>((event, emit) async {
      try {
        emit(DiscoverLoading());
        final newToday = await discoverRepository.getNewToday();
        final browseAll = await discoverRepository.getBrowseAll();
        emit(DiscoverSuccess(newToday, browseAll));
      } catch (e, s) {
        emit(DiscoverError(e, s));
      }
    });
  }
  final IDiscoverRepository discoverRepository;
}
