import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:myapp/app/domain/entities/purcharse_order.dart';
import 'package:myapp/app/domain/repository/order_repository.dart';
import 'package:myapp/core/errors/failure.dart';
import 'package:myapp/core/errors/usecases/usecase.dart';

class CreatePurcharseOrder implements UseCase<PurcharseOrder, Params> {
  final PurcharseOrderRepository repository;

  CreatePurcharseOrder(this.repository);

  Future<Either<Failure, PurcharseOrder>> call(Params params) async {
    return await repository.createPurcharseOrder(params.order);
  }
}

class Params extends Equatable {
  final PurcharseOrder order;
  Params({@required this.order});

  @override
  List<Object> get props => [order];
}
