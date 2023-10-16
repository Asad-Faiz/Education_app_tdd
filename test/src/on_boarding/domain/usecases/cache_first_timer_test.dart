import 'package:dartz/dartz.dart';
import 'package:education_app_using_tdd/core/errors/failure.dart';
import 'package:education_app_using_tdd/src/on_boarding/domain/repos/on_boarding_repo.dart';
import 'package:education_app_using_tdd/src/on_boarding/domain/usecases/cache_first_timer.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

import 'on_boarding_repo.mock.dart';

void main() {
  late OnBoardingRepo repo;
  late CacheFirstTimer usecase;
  setUp(
    () => {
      repo = MockOnBoardingRepo(),
      usecase = CacheFirstTimer(repo),
    },
  );

  test('should call [OnBoarding.cachefirsttimer] and return right data',
      () async {
    // arrange
    when(() => repo.cacheFirstTimer()).thenAnswer(
      (_) async => Left(
        ServerFailure(message: 'Unkown Error Occured', statusCode: 500),
      ),
    );

    // act
    final result = await usecase();

    // assert
    expect(
      result,
      equals(
        Left<Failure, dynamic>(
          ServerFailure(message: 'Unkown Error Occured', statusCode: 500),
        ),
      ),
    );

    verify(() => repo.cacheFirstTimer()).called(1);
    verifyNoMoreInteractions(repo);
  });
}
