import 'package:arabee_voice_recorder/core/utils/constants/error_codes.dart';

abstract class Failure {}

class ServerFailure implements Failure {
  final ErrorCodes errorCode;

  ServerFailure(this.errorCode);

  @override
  String toString() => 'ServerFailure(errorCode: $errorCode)';
}

class CacheFailure implements Failure {}
