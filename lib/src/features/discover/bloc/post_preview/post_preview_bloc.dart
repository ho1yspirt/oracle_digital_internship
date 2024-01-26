import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oracle_digital_internship/src/core/utils/models/post.dart';
import 'package:oracle_digital_internship/src/features/discover/data/repositories/discover_repository.dart';

part 'post_preview_event.dart';
part 'post_preview_state.dart';

class PostPreviewBloc extends Bloc<PostPreviewEvent, PostPreviewState> {
  PostPreviewBloc(this.discoverRepository) : super(PostPreviewInitial()) {
    on<LoadPostPreviewEvent>((event, emit) async {
      try {
        emit(PostPreviewLoading());
        final model = await discoverRepository.getSinglePostPreview(event.id);
        emit(PostPreviewSuccess(model));
      } catch (e, s) {
        emit(PostPreviewError(e, s));
      }
    });
  }

  final IDiscoverRepository discoverRepository;
}
