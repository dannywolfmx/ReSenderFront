import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/app/domain/application_service/loggin_service.dart';
import 'package:myapp/app/domain/entities/session_info.dart';
import 'package:myapp/app/domain/entities/user.dart';
import 'package:myapp/app/domain/repository/session_info_repository.dart';
import 'package:myapp/app/domain/usecase/loggin.dart';

class MockLogginService extends Mock
    implements LogginService<SessionInfo, Params> {}

class MockSessionInfo extends Mock implements SessionInfoRepository {}

void main() {
  MockLogginService service;
  MockSessionInfo repository;
  Loggin usecase;

  setUp(() {
    service = MockLogginService();
    repository = MockSessionInfo();
    usecase = Loggin(service: service, repository: repository);
  });

  //Access data to the systeam
  final tParamsLoggin = Params(username: "dannywolfmx", password: "1234");

  //Returnes loggin info
  final tLogginInfo = SessionInfo(
    user: User(
      username: "dannywolfmx",
    ),
    token: Token(
      value: "123456",
    ),
    isLoggedIn: true,
  );

  test('should loggin to the system', () async {
    //Arrange
    when(service(any)).thenAnswer((_) async => Right(tLogginInfo));
    when(repository.saveSessionInfo(any))
        .thenAnswer((_) async => Right(tLogginInfo));
    //Act
    final result = await usecase(tParamsLoggin);
    //Assert
    expect(result, Right(tLogginInfo));
    verify(service(tParamsLoggin)).called(1);
    verify(repository.saveSessionInfo(tLogginInfo)).called(1);
  });
}
