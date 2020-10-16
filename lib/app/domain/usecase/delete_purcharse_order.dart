import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:myapp/app/domain/entities/id.dart';
import 'package:myapp/app/domain/entities/purcharse_order.dart';
import 'package:myapp/app/domain/repository/order_repository.dart';
import 'package:myapp/core/errors/failure.dart';
import 'package:myapp/core/usecases/usecase.dart';

class DeletePurcharseOrder implements UseCase<PurcharseOrder, Params> {
  PurcharseOrderRepository repository;
  DeletePurcharseOrder(this.repository);
  @override
  Future<Either<Failure, PurcharseOrder>> call(params) async {
    return await repository.deletePurcharseOrder(params.idToDelete);
  }
}

class Params extends Equatable {
  final ID idToDelete;
  Params({
    @required this.idToDelete,
  });
  @override
  List<Object> get props => [idToDelete];
}
