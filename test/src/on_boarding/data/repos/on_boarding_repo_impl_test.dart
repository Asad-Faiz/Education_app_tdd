import 'package:dartz/dartz.dart';
import 'package:education_app_using_tdd/core/errors/exceptions.dart';
import 'package:education_app_using_tdd/core/errors/failure.dart';
import 'package:education_app_using_tdd/src/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:education_app_using_tdd/src/on_boarding/data/repos/on_boarding_repo_impl.dart';
import 'package:education_app_using_tdd/src/on_boarding/domain/repos/on_boarding_repo.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockOnBoardingLocalDataSource extends Mock
    implements OnBoardingLocalDataSource {}

void main() {
  late OnBoardingLocalDataSource localDataSource;
  late OnBoardingRepoImpl repoImp;
  setUp(() {
    localDataSource = MockOnBoardingLocalDataSource();
    repoImp = OnBoardingRepoImpl(localDataSource);
  });

  test('Should be  a subclass  of [OnBoardingRepo]', () {
    expect(repoImp, isA<OnBoardingRepo>());
  });

  group('cacheFirstTime', () {
    test('should complete succesfully when call to local source is successfull',
        () async {
      // arramge
      when(() => localDataSource.cacheFirstTimer())
          .thenAnswer((_) async => Future.value());
      // act
      final result = await repoImp.cacheFirstTimer();
      // assert
      expect(
        result,
        equals(const Right<dynamic, void>(null)),
      );
      verify(() => localDataSource.cacheFirstTimer()).called(1);
      verifyNoMoreInteractions(localDataSource);
    });

    // failure test
    test(
        'Should return [Cache Failure ] when call  to local source is '
        'unsuccessfull', () async {
      // arrange
      when(() => localDataSource.cacheFirstTimer())
          .thenThrow(const CacheException(message: 'Insufficent Storage'));

      // act
      final result = await repoImp.cacheFirstTimer();
      // assert
      expect(
        result,
        Left<CacheFailure, dynamic>(
          CacheFailure(message: 'Insufficent Storage', statusCode: 500),
        ),
      );
      verify(() => localDataSource.cacheFirstTimer()).called(1);
      verifyNoMoreInteractions(localDataSource);
    });
  });

  group('CheckIFUserIsFirstTimer', () {
    test('should return false if the  user is first timer', () async {
      // arramge
      when(() => localDataSource.checkIfUserIsFirstTimer())
          .thenAnswer((_) async => Future.value(false));
      // act
      final result = await repoImp.checkIfUserIsFirstTimer();
      // assert
      expect(
        result,
        equals(const Right<dynamic, bool>(false)),
      );
      verify(() => localDataSource.checkIfUserIsFirstTimer()).called(1);
      verifyNoMoreInteractions(localDataSource);
    });
    test('should return true if user is first timer', () async {
      // arramge
      when(() => localDataSource.checkIfUserIsFirstTimer())
          .thenAnswer((_) async => Future.value(true));
      // act
      final result = await repoImp.checkIfUserIsFirstTimer();
      // assert
      expect(
        result,
        equals(const Right<dynamic, bool>(true)),
      );
      verify(() => localDataSource.checkIfUserIsFirstTimer()).called(1);
      verifyNoMoreInteractions(localDataSource);
    });

    // failure test

    test(
        'Should return Cache Failure when call to local data source '
        'si unsuccessfull', () async {
      // arrange
      when(() => localDataSource.checkIfUserIsFirstTimer()).thenThrow(
        const CacheException(
          message: 'Insufficent permission',
          statusCode: 403,
        ),
      );

      // act
      final result = await repoImp.checkIfUserIsFirstTimer();
      // assert
      expect(
        result,
        equals(
          Left<CacheFailure, bool>(
            CacheFailure(
              message: 'Insufficent permission',
              statusCode: 403,
            ),
          ),
        ),
      );
      verify(() => localDataSource.checkIfUserIsFirstTimer()).called(1);
      verifyNoMoreInteractions(localDataSource);
    });
  });
}
