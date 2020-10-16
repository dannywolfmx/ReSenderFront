import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/app/domain/entities/client.dart';
import 'package:myapp/app/domain/entities/id.dart';
import 'package:myapp/app/domain/repository/client_repository.dart';
import 'package:myapp/app/domain/usecase/update_client_info.dart';
import 'package:myapp/core/usecases/usecase.dart';

class MockUpdateClientInfo extends Mock implements ClientRepository {}

void main() {
  UseCase usecase;
  MockUpdateClientInfo repository;
  setUp(() {
    repository = MockUpdateClientInfo();
    usecase = UpdateClientInfo(repository);
  });
  final tClientID = ID("123");
  final tClientUpdateData = Client(
    id: tClientID,
    name: "Daniel",
  );

  final tParamsUpdateData = Params(clientUpdateData: tClientUpdateData);

  test('should update a client info', () async {
    //Arrange
    when(repository.updateClient(any))
        .thenAnswer((_) async => Right(tClientUpdateData));
    //Act
    final result = await usecase(tParamsUpdateData);
    //Assert
    expect(result, Right(tClientUpdateData));
    verify(repository.updateClient(tClientUpdateData)).called(1);
  });
}
