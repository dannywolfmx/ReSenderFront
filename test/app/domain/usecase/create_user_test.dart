import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/app/domain/entities/user.dart';
import 'package:myapp/app/domain/repository/user_repository.dart';
import 'package:myapp/app/domain/usecase/create_user.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  CreateUser usecase;
  MockUserRepository repository;
  setUp(() {
    repository = MockUserRepository();
    usecase = CreateUser(repository);
  });

  final tNewUsename = "Daniel";
  final tNewPassword = "123456";
  final tNewUser = User(username: tNewUsename);

  test('should create a user', () async {
    //Arrange
    when(repository.createUser(any, any))
        .thenAnswer((_) async => Right(tNewUser));
    //Act
    final result =
        await usecase(Params(username: tNewUsename, password: tNewPassword));
    //Assert
    expect(result, Right(tNewUser));
    verify(repository.createUser(tNewUsename, tNewPassword)).called(1);
  });
}
