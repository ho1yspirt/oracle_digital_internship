part of 'initial_bloc.dart';

sealed class InitialState extends Equatable {
  const InitialState();

  @override
  List<Object> get props => [];
}

final class InitialInitial extends InitialState {
  @override
  List<Object> get props => [];
}

final class InitialLoading extends InitialState {
  @override
  List<Object> get props => [];
}

final class InitialSuccess extends InitialState {
  const InitialSuccess(this.model);

  final PostResponseModel model;

  @override
  List<Object> get props => [model];
}

final class InitialError extends InitialState {
  const InitialError(this.e, this.s);

  final Object e;
  final StackTrace s;
  @override
  List<Object> get props => [];
}
