part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchAllEvent extends SearchEvent {
  const SearchAllEvent(this.value);

  final String value;

  @override
  List<Object> get props => [];
}
