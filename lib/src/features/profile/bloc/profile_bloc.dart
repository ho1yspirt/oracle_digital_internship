import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oracle_digital_internship/src/core/utils/models/post_preview.dart';
import 'package:oracle_digital_internship/src/features/profile/data/models/profile.dart';
import 'package:oracle_digital_internship/src/features/profile/data/repositories/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this.profileRepository) : super(ProfileInitial()) {
    on<LoadProfilePageEvent>((event, emit) async {
      try {
        emit(ProfileLoading());
        final profile = await profileRepository.getProfile();
        final profileImages = await profileRepository.getProfileImages();
        emit(ProfileSuccess(profile, profileImages));
      } catch (e, s) {
        emit(ProfileError(e, s));
      }
    });
  }

  final IProfileRepository profileRepository;
}
