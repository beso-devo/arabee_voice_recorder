import 'dart:convert';
import 'package:arabee_voice_recorder/core/data/prefs/prefs_helper.dart';
import 'package:arabee_voice_recorder/core/error/failures.dart';
import 'package:arabee_voice_recorder/core/utils/constants/dio_options.dart';
import 'package:arabee_voice_recorder/core/utils/constants/error_codes.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class BaseRepository {
  Map<String, dynamic> getBaseHeaders();

  Future<Either<Failure, bool>> logout();
}

class BaseRepositoryImpl extends BaseRepository {
  final PrefsHelper prefsHelper;
  final Dio dio;

  BaseRepositoryImpl({
    required this.prefsHelper,
    required this.dio,
  });

  @override
  Map<String, dynamic> getBaseHeaders() {
    Map<String, dynamic> headers = {};
    if (prefsHelper.getIsLoggedIn) {
      headers['token'] = prefsHelper.getUserToken.contains("Bearer")
          ? prefsHelper.getUserToken
          : "Bearer ${prefsHelper.getUserToken}";
    }
    return headers;
  }

  @override
  Future<Either<Failure, bool>> logout({bool isChangeType = false}) async {
    try {
      await dio.post("/logout",
          options: GetOptions.getOptionsWithToken(getBaseHeaders()['token']));
      return const Right(true);
    } catch (e) {
      if (e is DioError) {
        if (e.response != null &&
            json.decode(e.response!.data)['message'] == "****") {
          return Left(ServerFailure(ErrorCodes.tokenExpired));
        } else {
          return Left(ServerFailure(ErrorCodes.noConnection));
        }
      }
      print(e);
      return Left(ServerFailure(ErrorCodes.serverError));
    }
  }
}
