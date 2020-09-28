import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/app/domain/entities/client.dart';
import 'package:myapp/app/domain/repository/client_repository.dart';
import 'package:myapp/app/domain/usecase/create_client.dart';

class MockClientRepository extends Mock implements ClientRepository {}

void main() {
  MockClientRepository repository;
  CreateClient usecase;

  setUp(() {
    repository = MockClientRepository();
    usecase = CreateClient(repository);
  });

  final tClient = Client(id: "1234", name: "Daniel");
  final tNewClient = Client(name: "Daniel");

  test('should create a client', () async {
    //Arrange
    when(repository.createClient(any)).thenAnswer((_) async => Right(tClient));

    //Act
    final result = usecase(Params(client: tNewClient));

    //Assert
    expect(result, Right(tClient));
    verify(repository.createClient(tClient));
    verifyNoMoreInteractions(repository);
  });
}
