import 'package:dartz/dartz.dart';
import 'package:myapp/app/domain/entities/loggin_info.dart';
import 'package:myapp/core/errors/failure.dart';

abstract class LogginService<Type, LogginParams> {
  Future<Either<Failure, LogginInfo>> call(LogginParams params);
}
