import 'package:equatable/equatable.dart';
import 'package:myapp/app/domain/entities/client.dart';
import 'package:myapp/app/domain/repository/client_repository.dart';
import 'package:myapp/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:myapp/core/usecases/usecase.dart';

class UpdateClientInfo implements UseCase<Client, Params> {
  ClientRepository repository;
  UpdateClientInfo(this.repository);
  @override
  Future<Either<Failure, Client>> call(params) async {
    return await repository.updateClient(params.clientUpdateData);
  }
}

class Params extends Equatable {
  final Client clientUpdateData;
  Params({
    @required this.clientUpdateData,
  });

  @override
  List<Object> get props => [];
}
