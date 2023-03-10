import 'package:arabee_voice_recorder/core/utils/validator/input_validators.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  /// Adding the [Dio] instance to the graph to be later used by the local data sources
  @lazySingleton
  Dio dio(SharedPreferences sharedPreferences) {
    final dio = Dio(
      BaseOptions(
        connectTimeout: 60000,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        responseType: ResponseType.plain,
      ),
    );
    dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
        responseHeader: true,
        requestHeader: true,
        request: true,
      ),
    );

    return dio;
  }

  /// Adding the [SharedPreferences] instance to the graph to be later used by the local data sources
  @lazySingleton
  @preResolve
  Future<SharedPreferences> get prefs async {
    return await SharedPreferences.getInstance();
  }


  @lazySingleton
  InputValidators get signUpInputValidators => InputValidators();
}
