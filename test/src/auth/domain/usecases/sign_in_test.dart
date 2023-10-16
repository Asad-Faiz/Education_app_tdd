import 'package:dartz/dartz.dart';
import 'package:education_app_using_tdd/src/auth/domain/entities/user.dart';
import 'package:education_app_using_tdd/src/auth/domain/repos/auth_repo.dart';
import 'package:education_app_using_tdd/src/auth/domain/usecases/sign_in.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockAuthRepo extends Mock implements AuthRepo {}

void main() {
  late AuthRepo repo;
  late SignIn usecase;
  final tUser = LocalUser.empty();
  final tEmail = 'email';
  final tPassword = 'password';
  setUp(() => {
        repo = MockAuthRepo(),
        usecase = SignIn(repo),
      });

  test('should reqturn Local user after success', () async {
    // arrange
    when(() => repo.signIn(
            email: any(named: 'email'), password: any(named: 'password')))
        .thenAnswer((_) async => Right(tUser));

    final result =
        await usecase(SignInParams(email: tEmail, password: tPassword));

    expect(result, Right<dynamic, LocalUser>(tUser));

    verify(() => repo.signIn(email: tEmail, password: tPassword)).called(1);
    verifyNoMoreInteractions(repo);
  });
}
