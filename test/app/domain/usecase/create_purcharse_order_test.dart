import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/app/domain/entities/id.dart';
import 'package:myapp/app/domain/entities/purcharse_order.dart';
import 'package:myapp/app/domain/repository/order_repository.dart';
import 'package:myapp/app/domain/usecase/create_purcharse_order.dart';

class MockOrderRepository extends Mock implements PurcharseOrderRepository {}

void main() {
  CreatePurcharseOrder usecase;
  MockOrderRepository repository;

  setUp(() {
    repository = MockOrderRepository();
    usecase = CreatePurcharseOrder(repository);
  });

  final tNewOrder = PurcharseOrder(id: null, invoice: "1234", order: "1234");
  final tResponsaeOrder =
      PurcharseOrder(id: ID("1"), invoice: "1234", order: "1234");

  test('should create a new purcharse order', () async {
    //arrange
    when(repository.createPurcharseOrder(any))
        .thenAnswer((_) async => Right(tResponsaeOrder));
    //act
    final result = await usecase(Params(order: tNewOrder));
    //assert
    expect(result, Right(tResponsaeOrder));
    verify(repository.createPurcharseOrder(tNewOrder));
    verifyNoMoreInteractions(repository);
  });
}
