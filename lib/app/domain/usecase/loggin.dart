import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:myapp/app/domain/application_service/loggin_service.dart';

import 'package:myapp/app/domain/entities/session_info.dart';
import 'package:myapp/app/domain/repository/session_info_repository.dart';
import 'package:myapp/core/errors/failure.dart';
import 'package:myapp/core/usecases/usecase.dart';

class Loggin implements UseCase<SessionInfo, Params> {
  final LogginService service;
  final SessionInfoRepository repository;

  Loggin({@required this.service, @required this.repository});

  @override
  Future<Either<Failure, SessionInfo>> call(Params params) async {
    return (await service(params)).fold(
      (failure) => Left(failure),
      (logginInfo) => repository.saveSessionInfo(logginInfo),
    );
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
