import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:myapp/app/domain/entities/user.dart';
import 'package:myapp/app/domain/repository/user_repository.dart';
import 'package:myapp/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:myapp/core/usecases/usecase.dart';

class CreateUser implements UseCase<User, Params> {
  final UserRepository repository;

  CreateUser(this.repository);

  @override
  Future<Either<Failure, User>> call(Params params) {
    return repository.createUser(params.username, params.password);
  }
}

class Params extends Equatable {
  final String username;
  final String password;

  Params({
    @required this.username,
    @required this.password,
  })  : assert(username != null),
        assert(password != null);

  @override
  List<Object> get props => [];
}
