part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

final class SearchLoading extends SearchState {
  @override
  List<Object> get props => [];
}

final class SearchSuccess extends SearchState {
  const SearchSuccess(this.modelList);

  final List<PostPreviewResponseModel> modelList;

  @override
  List<Object> get props => [modelList];
}

final class SearchError extends SearchState {
  const SearchError(this.e, this.s);

  final Object e;
  final StackTrace s;
  @override
  List<Object> get props => [];
}
