import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/app/domain/entities/loggin_info.dart';
import 'package:myapp/app/domain/entities/user.dart';
import 'package:myapp/app/domain/service/loggin_service.dart';
import 'package:myapp/app/domain/usecase/loggin.dart';

class MockLogginService extends Mock
    implements LogginService<LogginInfo, Params> {}

void main() {
  Loggin usecase;
  MockLogginService service;

  setUp(() {
    service = MockLogginService();
    usecase = Loggin(service);
  });

  //Access data to the systeam
  final tParamsLoggin = Params(username: "dannywolfmx", password: "1234");

  //Returnes loggin info
  final tLogginInfo = LogginInfo(
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
    //Act
    final result = await usecase(tParamsLoggin);
    //Assert
    expect(result, Right(tLogginInfo));
    verify(service(tParamsLoggin)).called(1);
  });
}
