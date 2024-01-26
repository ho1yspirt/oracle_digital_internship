import 'dart:convert';

import 'package:oracle_digital_internship/src/core/utils/models/post_preview.dart';
import 'package:oracle_digital_internship/src/features/profile/data/datasources/profile_datasource.dart';
import 'package:oracle_digital_internship/src/features/profile/data/models/profile.dart';

abstract interface class IProfileRepository {
  Future<ProfileResponseModel> getProfile();

  Future<List<PostPreviewResponseModel>> getProfileImages();
}

class ProfileRepository implements IProfileRepository {
  ProfileRepository(this.profileDataSource);

  final IProfileDataSource profileDataSource;

  @override
  Future<ProfileResponseModel> getProfile() async {
    try {
      final response = await profileDataSource.getProfile();
      return ProfileResponseModel.fromRawJson(response.data);
    } catch (e, s) {
      throw FormatException(e.toString(), s);
    }
  }

  @override
  Future<List<PostPreviewResponseModel>> getProfileImages() async {
    try {
      final response = await profileDataSource.getProfileImages();
      final List<PostPreviewResponseModel> result =
          List<PostPreviewResponseModel>.from(jsonDecode(response.data)
              .map((i) => PostPreviewResponseModel.fromJson(i)));
      return result;
    } catch (e, s) {
      throw FormatException(e.toString(), s);
    }
  }
}
