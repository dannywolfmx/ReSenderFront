import 'package:dartz/dartz.dart';
import 'package:myapp/app/domain/entities/session_info.dart';
import 'package:myapp/core/errors/failure.dart';

abstract class LogginService<Type, LogginParams> {
  Future<Either<Failure, SessionInfo>> call(LogginParams params);
}
