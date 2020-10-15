import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/app/domain/entities/client.dart';
import 'package:myapp/app/domain/entities/id.dart';
import 'package:myapp/app/domain/repository/client_repository.dart';
import 'package:myapp/app/domain/usecase/delete_client.dart';
import 'package:myapp/core/usecases/usecase.dart';

class MockClientRepository extends Mock implements ClientRepository {}

void main() {
  UseCase usecase;
  MockClientRepository repository;
  setUp(() {
    repository = MockClientRepository();
    usecase = DeleteClient(repository);
  });

  final tIdClientToDelete = ID("123");
  final tInfoClient = Params(tIdClientToDelete);

  final tResponseClient = Client(name: "Prueba");

  test('should delete a client', () async {
    //Arrange
    when(repository.deleteClient(any))
        .thenAnswer((_) async => Right(tResponseClient));
    //Act
    final result = await usecase(tInfoClient);
    //Assert
    expect(result, Right(tResponseClient));
    verify(repository.deleteClient(tIdClientToDelete)).called(1);
  });
}
