import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:myapp/app/domain/entities/client.dart';
import 'package:myapp/app/domain/repository/client_repository.dart';
import 'package:myapp/core/errors/failure.dart';
import 'package:myapp/core/errors/usecases/usecase.dart';

class CreateClient implements UseCase<Client, Params> {
  ClientRepository repository;
  CreateClient(this.repository);

  @override
  Future<Either<Failure, Client>> call(Params params) async {
    return await repository.createClient(params.client);
  }
}

class Params extends Equatable {
  final Client client;
  Params({@required this.client});

  @override
  List<Object> get props => [client];
}
