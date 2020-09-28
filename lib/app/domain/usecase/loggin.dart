import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:myapp/app/domain/entities/loggin_info.dart';
import 'package:myapp/app/domain/service/loggin_service.dart';
import 'package:myapp/core/errors/failure.dart';
import 'package:myapp/core/errors/usecases/usecase.dart';

class Loggin implements UseCase<LogginInfo, Params> {
  final LogginService service;

  Loggin(this.service);

  @override
  Future<Either<Failure, LogginInfo>> call(Params params) async {
    return await service(params);
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
  List<Object> get props => [username, password];
}
