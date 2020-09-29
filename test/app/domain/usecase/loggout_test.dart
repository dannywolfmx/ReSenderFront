import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/app/domain/repository/session_info_repository.dart';
import 'package:myapp/app/domain/usecase/loggout.dart';
import 'package:myapp/core/usecases/usecase.dart';

class MockSessionInfoRepository extends Mock implements SessionInfoRepository {}

void main() {
  MockSessionInfoRepository repository;
  Loggout usecase;

  setUp(() {
    repository = MockSessionInfoRepository();
    usecase = Loggout(repository);
  });

  final tResponse = true;
  test('should loggout from the application', () async {
    //Arrange
    when(repository.deleteSessionInfo())
        .thenAnswer((_) async => Right(tResponse));

    //Act
    final result = await usecase(NoParams());
    //Assert
    expect(result, Right(tResponse));
    verify(repository.deleteSessionInfo()).called(1);
  });
}
