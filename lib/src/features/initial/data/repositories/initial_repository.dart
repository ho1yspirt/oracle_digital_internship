import 'package:oracle_digital_internship/src/core/utils/models/post.dart';
import 'package:oracle_digital_internship/src/features/initial/data/datasources/initial_datasource.dart';

abstract interface class IInitialRepository {
  Future<PostResponseModel> getInitialPost();
}

class InitialRepository implements IInitialRepository {
  InitialRepository(this.initialDataSource);

  final IInitialDataSource initialDataSource;

  @override
  Future<PostResponseModel> getInitialPost() async {
    try {
      final response = await initialDataSource.getInitialPost();
      return PostResponseModel.fromRawJson(response.data);
    } catch (e, s) {
      throw FormatException(e.toString(), s);
    }
  }
}
