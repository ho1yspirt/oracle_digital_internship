import 'dart:convert';

import 'package:oracle_digital_internship/src/core/utils/models/post.dart';
import 'package:oracle_digital_internship/src/core/utils/models/post_preview.dart';
import 'package:oracle_digital_internship/src/features/discover/data/datasources/discover_datasource.dart';

abstract interface class IDiscoverRepository {
  Future<List<PostResponseModel>> getNewToday();

  Future<List<PostPreviewResponseModel>> getBrowseAll();

  Future<PostResponseModel> getSinglePostPreview(String id);
}

class DiscoverRepository implements IDiscoverRepository {
  DiscoverRepository(this.discoverDataSource);

  final IDiscoverDataSource discoverDataSource;

  @override
  Future<List<PostPreviewResponseModel>> getBrowseAll() async {
    try {
      final response = await discoverDataSource.getBrowseAll();
      final List<PostPreviewResponseModel> result =
          List<PostPreviewResponseModel>.from(jsonDecode(response.data)
              .map((i) => PostPreviewResponseModel.fromJson(i)));

      return result;
    } catch (e, s) {
      throw FormatException(e.toString(), s);
    }
  }

  @override
  Future<List<PostResponseModel>> getNewToday() async {
    try {
      final response = await discoverDataSource.getNewToday();
      final List<PostResponseModel> result = List<PostResponseModel>.from(
          jsonDecode(response.data).map((i) => PostResponseModel.fromJson(i)));
      return result;
    } catch (e, s) {
      throw FormatException(e.toString(), s);
    }
  }

  @override
  Future<PostResponseModel> getSinglePostPreview(String id) async {
    try {
      final response = await discoverDataSource.getSinglePostPreview(id);
      return PostResponseModel.fromRawJson(response.data);
    } catch (e, s) {
      throw FormatException(e.toString(), s);
    }
  }
}
