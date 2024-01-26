part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

final class ProfileLoading extends ProfileState {
  @override
  List<Object> get props => [];
}

final class ProfileSuccess extends ProfileState {
  const ProfileSuccess(this.profile, this.profileImages);

  final ProfileResponseModel profile;
  final List<PostPreviewResponseModel> profileImages;

  @override
  List<Object> get props => [profile];
}

final class ProfileError extends ProfileState {
  const ProfileError(this.e, this.s);

  final Object e;
  final StackTrace s;
  @override
  List<Object> get props => [];
}
