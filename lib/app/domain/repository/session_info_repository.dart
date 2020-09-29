import 'package:dartz/dartz.dart';
import 'package:myapp/core/errors/failure.dart';

import 'package:myapp/app/domain/entities/session_info.dart';

abstract class SessionInfoRepository {
  //Just we can have a unique session
  Future<Either<Failure, SessionInfo>> saveSessionInfo(SessionInfo loggin);
  Future<Either<Failure, SessionInfo>> getSessionInfo();
  Future<Either<Failure, bool>> deleteSessionInfo();
}
