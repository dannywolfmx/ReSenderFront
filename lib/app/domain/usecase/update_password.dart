import 'package:equatable/equatable.dart';
import 'package:myapp/app/domain/entities/user.dart';
import 'package:myapp/app/domain/repository/user_repository.dart';
import 'package:myapp/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:myapp/core/usecases/usecase.dart';

class UpdatePassword extends UseCase<User, Params> {
  final UserRepository repository;

  UpdatePassword(this.repository);
  @override
  Future<Either<Failure, User>> call(params) {
    return repository.updatePassword(
        params.userName, params.oldPassword, params.newPassword);
  }
}

class Params extends Equatable {
  final String userName;
  final String oldPassword;
  final String newPassword;
  Params({
    @required this.userName,
    @required this.oldPassword,
    @required this.newPassword,
  })  : assert(userName != null),
        assert(oldPassword != null),
        assert(newPassword != null);

  @override
  List<Object> get props => [userName, oldPassword, newPassword];
}
