import 'package:dartz/dartz.dart';
import 'package:myapp/app/domain/entities/user.dart';
import 'package:myapp/core/errors/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getData();
  Future<Either<Failure, User>> createUser(String username, String password);
}
