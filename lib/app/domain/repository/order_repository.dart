import 'package:dartz/dartz.dart';
import 'package:myapp/app/domain/entities/id.dart';
import 'package:myapp/app/domain/entities/purcharse_order.dart';

import 'package:myapp/core/errors/failure.dart';

abstract class PurcharseOrderRepository {
  Future<Either<Failure, List<PurcharseOrder>>> getOrders();
  Future<Either<Failure, PurcharseOrder>> createPurcharseOrder(
      PurcharseOrder newOrder);
  Future<Either<Failure, PurcharseOrder>> deletePurcharseOrder(ID id);
}
