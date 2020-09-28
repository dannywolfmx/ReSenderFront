import 'package:dartz/dartz.dart';
import 'package:myapp/app/domain/entities/user.dart';
import 'package:myapp/core/errors/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getData();
}
