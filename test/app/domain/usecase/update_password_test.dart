import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/app/domain/entities/user.dart';
import 'package:myapp/app/domain/repository/user_repository.dart';
import 'package:myapp/app/domain/usecase/update_password.dart';
import 'package:myapp/core/usecases/usecase.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  UseCase usecase;
  MockUserRepository repository;

  setUp(() {
    repository = MockUserRepository();
    usecase = UpdatePassword(repository);
  });

  final tOldPassword = "12345";
  final tNewPassword = "123ABC";
  final tUserName = "Daniel";
  final tUser = User(username: tUserName);
  final tParams = Params(
    userName: tUserName,
    oldPassword: tOldPassword,
    newPassword: tNewPassword,
  );
  test('should update a password', () async {
    //Arrange
    when(repository.updatePassword(any, any, any))
        .thenAnswer((_) async => Right(tUser));
    //Act
    final result = await usecase(tParams);
    //Assert
    expect(result, Right(tUser));
    verify(repository.updatePassword(tUserName, tOldPassword, tNewPassword))
        .called(1);
  });
}
