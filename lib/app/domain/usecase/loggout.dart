import 'package:equatable/equatable.dart';
import 'package:myapp/app/domain/repository/session_info_repository.dart';
import 'package:myapp/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:myapp/core/usecases/usecase.dart';

class Loggout implements UseCase<bool, NoParams> {
  final SessionInfoRepository repository;
  Loggout(this.repository);
  @override
  Future<Either<Failure, bool>> call(param) async {
    return await repository.deleteSessionInfo();
  }
}
