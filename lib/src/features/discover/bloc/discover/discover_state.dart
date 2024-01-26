part of 'discover_bloc.dart';

sealed class DiscoverState extends Equatable {
  const DiscoverState();

  @override
  List<Object> get props => [];
}

final class DiscoverInitial extends DiscoverState {
  @override
  List<Object> get props => [];
}

final class DiscoverLoading extends DiscoverState {
  @override
  List<Object> get props => [];
}

final class DiscoverSuccess extends DiscoverState {
  const DiscoverSuccess(this.newToday, this.browseAll);

  final List<PostResponseModel> newToday;
  final List<PostPreviewResponseModel> browseAll;

  @override
  List<Object> get props => [newToday, browseAll];
}

final class DiscoverError extends DiscoverState {
  const DiscoverError(this.e, this.s);

  final Object e;
  final StackTrace s;
  @override
  List<Object> get props => [];
}
