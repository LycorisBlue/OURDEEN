import 'package:dartz/dartz.dart';
import '/configs/injectiondepency/injection.dart';
import '/constants/api_path.dart';
import '/data/models/user.dart';
import '/services/networks/apis/api_base.dart';
import '/services/networks/apis/rest_api_reponse.dart';
import '/services/networks/apis/rest_api_service.dart';

abstract class CoranRepository {
  Future<Either<List<String>, ApiResponse>> getCoran();
  Future<Either<List<String>, ApiResponse>> getTraductionSourate(int sourateId);
  Future<Either<List<String>, ApiResponse>> getTranslitterationSourate(int sourateId);
}

class CoranRepositoryImpl extends ApiBase<UserAccount>
    implements CoranRepository {
  @override
  Future<Either<List<String>, ApiResponse>> getCoran() async {
    return await makeRequestApi(sl<RestApiServices>().dio.get(ApiPath.quran));
  }

  @override
  Future<Either<List<String>, ApiResponse>> getTraductionSourate(
      int sourateId) async {
    return await makeRequestApi(sl<RestApiServices>()
        .dio
        .get(ApiPath.sourateTraductionText(sourateId, "fr.hamidullah")));
  }

  @override
  Future<Either<List<String>, ApiResponse>> getTranslitterationSourate(
      int sourateId) async {
    return await makeRequestApi(sl<RestApiServices>()
        .dio
        .get(ApiPath.sourateTraductionText(sourateId, "en.transliteration")));
  }
}
