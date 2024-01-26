part of 'post_preview_bloc.dart';

sealed class PostPreviewEvent extends Equatable {
  const PostPreviewEvent();

  @override
  List<Object> get props => [];
}

class LoadPostPreviewEvent extends PostPreviewEvent {
  const LoadPostPreviewEvent(this.id);

  final String id;

  @override
  List<Object> get props => [id];
}
