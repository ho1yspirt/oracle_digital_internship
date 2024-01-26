import 'dart:convert';

import 'package:oracle_digital_internship/src/core/utils/models/post_preview.dart';
import 'package:oracle_digital_internship/src/features/search/data/datasources/search_datasource.dart';

abstract interface class ISearchRepository {
  Future<List<PostPreviewResponseModel>> searchAll(String value);
}

class SearchRepository implements ISearchRepository {
  const SearchRepository(this.searchDataSource);

  final ISearchDataSource searchDataSource;

  @override
  Future<List<PostPreviewResponseModel>> searchAll(String value) async {
    try {
      final response = await searchDataSource.searchAll(value);
      final List<PostPreviewResponseModel> result =
          List<PostPreviewResponseModel>.from(jsonDecode(response.data)
              .map((i) => PostPreviewResponseModel.fromJson(i)));
      return result;
    } catch (e, s) {
      throw FormatException(e.toString(), s);
    }
  }
}
