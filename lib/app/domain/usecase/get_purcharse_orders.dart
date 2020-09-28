import 'package:dartz/dartz.dart';
import 'package:myapp/app/domain/entities/purcharse_order.dart';
import 'package:myapp/app/domain/repository/order_repository.dart';
import 'package:myapp/core/errors/failure.dart';
import 'package:myapp/core/errors/usecases/usecase.dart';

class GetPurcharseOrders implements UseCase<List<PurcharseOrder>, NoParams> {
  final PurcharseOrderRepository repository;

  GetPurcharseOrders(this.repository);

  Future<Either<Failure, List<PurcharseOrder>>> call(NoParams params) async {
    return await repository.getOrders();
  }
}
