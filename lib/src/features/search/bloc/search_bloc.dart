import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oracle_digital_internship/src/core/utils/models/post_preview.dart';
import 'package:oracle_digital_internship/src/features/search/data/repositories/search_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.searchRepository) : super(SearchInitial()) {
    on<SearchAllEvent>((event, emit) async {
      try {
        emit(SearchLoading());
        final modelList = await searchRepository.searchAll(event.value);
        emit(SearchSuccess(modelList));
      } catch (e, s) {
        emit(SearchError(e, s));
      }
    });
  }
  final ISearchRepository searchRepository;
}
