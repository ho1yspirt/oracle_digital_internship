part of 'initial_bloc.dart';

sealed class InitialEvent extends Equatable {
  const InitialEvent();

  @override
  List<Object> get props => [];
}

class ShowInitialPostEvent extends InitialEvent {
  @override
  List<Object> get props => [];
}
