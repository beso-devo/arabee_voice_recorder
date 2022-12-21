import 'package:arabee_voice_recorder/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class InputValidators {
  RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  RegExp passwordRegExp =
      RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");

  Either<Failure, String> validateEmailInput(String email) {
    if (email.contains('.') && email.contains('@')) {
      return Right(email);
    } else
      return Left(InvalidInputFailure());
  }

  Either<Failure, String> validatePasswordInput(String password) {
    if (passwordRegExp.hasMatch(password)) {
      return Right(password);
    } else
      return Left(InvalidInputFailure());
  }

  Either<Failure, String> validateUserNameInput(String username) {
    if (username.length > 5)
      return Right(username);
    else
      return Left(InvalidInputFailure());
  }
}

class InvalidInputFailure extends Failure {}
