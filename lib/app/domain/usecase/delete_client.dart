import 'package:equatable/equatable.dart';
import 'package:myapp/app/domain/entities/client.dart';
import 'package:myapp/app/domain/entities/id.dart';
import 'package:myapp/app/domain/repository/client_repository.dart';
import 'package:myapp/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:myapp/core/usecases/usecase.dart';

class DeleteClient implements UseCase<Client, Params> {
  final ClientRepository repository;
  DeleteClient(this.repository);

  @override
  Future<Either<Failure, Client>> call(params) async {
    return await repository.deleteClient(params.idClientToDelete);
  }
}

class Params extends Equatable {
  final ID idClientToDelete;
  Params(this.idClientToDelete);

  @override
  List<Object> get props => [idClientToDelete];
}
