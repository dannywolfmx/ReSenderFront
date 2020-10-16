import 'package:dartz/dartz.dart';
import 'package:myapp/app/domain/entities/client.dart';
import 'package:myapp/app/domain/entities/id.dart';
import 'package:myapp/core/errors/failure.dart';

abstract class ClientRepository {
  Future<Either<Failure, Client>> createClient(Client client);
  Future<Either<Failure, Client>> updateClient(Client client);
  Future<Either<Failure, Client>> deleteClient(ID id);
  Future<Either<Failure, List<Client>>> getClients();
}
