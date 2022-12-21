import 'package:arabee_voice_recorder/core/utils/constants/error_codes.dart';


class ServerException implements Exception {
  final ErrorCodes errorCode;

  ServerException(this.errorCode);
}

class CacheException implements Exception {}
