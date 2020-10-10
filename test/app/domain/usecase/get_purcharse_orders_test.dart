import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/app/domain/entities/id.dart';
import 'package:myapp/app/domain/entities/purcharse_order.dart';
import 'package:myapp/app/domain/repository/order_repository.dart';
import 'package:myapp/app/domain/usecase/get_purcharse_orders.dart';
import 'package:myapp/core/usecases/usecase.dart';

class MockOrderRepository extends Mock implements PurcharseOrderRepository {}

void main() {
  GetPurcharseOrders usecase;
  MockOrderRepository mockOrderRepository;

  setUp(() {
    mockOrderRepository = MockOrderRepository();
    usecase = GetPurcharseOrders(mockOrderRepository);
  });

  final tPurcharseOrders = <PurcharseOrder>[
    PurcharseOrder(id: ID("1"), invoice: "1234", order: "1234"),
    PurcharseOrder(id: ID("2"), invoice: "1234", order: "1234"),
    PurcharseOrder(id: ID("3"), invoice: "1234", order: "1234"),
  ];

  test(
    'should get all the purcharse orders',
    () async {
      //arrange
      when(mockOrderRepository.getOrders())
          .thenAnswer((_) async => Right(tPurcharseOrders));
      //act
      final result = await usecase(NoParams());
      //assert
      expect(result, Right(tPurcharseOrders));
      verify(mockOrderRepository.getOrders());
      verifyNoMoreInteractions(mockOrderRepository);
    },
  );
}
