part of 'post_preview_bloc.dart';

sealed class PostPreviewState extends Equatable {
  const PostPreviewState();

  @override
  List<Object> get props => [];
}

final class PostPreviewInitial extends PostPreviewState {
  @override
  List<Object> get props => [];
}

final class PostPreviewLoading extends PostPreviewState {
  @override
  List<Object> get props => [];
}

final class PostPreviewSuccess extends PostPreviewState {
  const PostPreviewSuccess(this.model);

  final PostResponseModel model;

  @override
  List<Object> get props => [model];
}

final class PostPreviewError extends PostPreviewState {
  const PostPreviewError(this.e, this.s);

  final Object e;
  final StackTrace s;
  @override
  List<Object> get props => [];
}
