import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/app/domain/entities/id.dart';
import 'package:myapp/app/domain/entities/purcharse_order.dart';
import 'package:myapp/app/domain/repository/order_repository.dart';
import 'package:myapp/app/domain/usecase/delete_purcharse_order.dart';
import 'package:myapp/core/usecases/usecase.dart';

class MockPurcharseOrderRepository extends Mock
    implements PurcharseOrderRepository {}

void main() {
  UseCase usecase;
  MockPurcharseOrderRepository repository;
  setUp(() {
    repository = MockPurcharseOrderRepository();
    usecase = DeletePurcharseOrder(repository);
  });

  final tIdToDelete = ID("123");
  final tParametesToDelete = Params(idToDelete: tIdToDelete);

  final tResponseDelete = PurcharseOrder(
    id: tIdToDelete,
    invoice: "1234",
    order: "1234",
  );

  test('should delete a purcharse order', () async {
    //Arrange
    when(repository.deletePurcharseOrder(any))
        .thenAnswer((_) async => Right(tResponseDelete));
    //act
    final result = await usecase(tParametesToDelete);
    //Assert
    expect(result, Right(tResponseDelete));
    verify(repository.deletePurcharseOrder(tParametesToDelete.idToDelete))
        .called(1);
  });
}
