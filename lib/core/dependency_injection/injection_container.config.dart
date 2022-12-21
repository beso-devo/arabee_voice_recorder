// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:arabee_voice_recorder/core/data/prefs/prefs_helper.dart' as _i6;
import 'package:arabee_voice_recorder/core/utils/validator/input_validators.dart'
    as _i3;
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import 'register_module.dart' as _i7;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.InputValidators>(
      () => registerModule.signUpInputValidators);
  await gh.lazySingletonAsync<_i4.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i5.Dio>(
      () => registerModule.dio(gh<_i4.SharedPreferences>()));
  gh.lazySingleton<_i6.PrefsHelper>(
      () => _i6.PrefsHelper(gh<_i4.SharedPreferences>()));
  return getIt;
}

class _$RegisterModule extends _i7.RegisterModule {}
