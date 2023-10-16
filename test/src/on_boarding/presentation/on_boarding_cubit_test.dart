import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:education_app_using_tdd/core/errors/failure.dart';
import 'package:education_app_using_tdd/src/on_boarding/domain/usecases/cache_first_timer.dart';
import 'package:education_app_using_tdd/src/on_boarding/domain/usecases/check_if_user_is_first_timer.dart';
import 'package:education_app_using_tdd/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockCacheFirstTimer extends Mock implements CacheFirstTimer {}

class MockCheckIfUserIsFirstTimer extends Mock
    implements CheckIfUserIsFirstTimer {}

void main() {
  late CacheFirstTimer cacheFirstTimer;
  late CheckIfUserIsFirstTimer checkIfUserIsFirstTimer;
  late OnBoardingCubit onBoardingCubit;

  setUp(() {
    cacheFirstTimer = MockCacheFirstTimer();
    checkIfUserIsFirstTimer = MockCheckIfUserIsFirstTimer();
    onBoardingCubit = OnBoardingCubit(
      cacheFirstTimer: cacheFirstTimer,
      checkIfUserIsFirstTimer: checkIfUserIsFirstTimer,
    );
  });
  final tFailure = CacheFailure(
    message: 'Insuficient Storage Permission',
    statusCode: 400,
  );
  test('initial State should be [OnBoardinginitial]', () {
    expect(onBoardingCubit.state, const OnBoardingInitial());
  });

  group('cacheFirstTimer', () {
    blocTest<OnBoardingCubit, OnBoardingState>(
      'emits [cachingFirstTimer,UserCached] when succeeded',
      build: () {
        when(() => cacheFirstTimer()).thenAnswer(
          (_) async => const Right(null),
        );
        return onBoardingCubit;
      },
      act: (onBoardingCubit) => onBoardingCubit.cacheFirstTimer(),
      expect: () => const [CachingFirstTimer(), UserCached()],
      verify: (_) {
        verify(() => cacheFirstTimer()).called(1);
        verifyNoMoreInteractions(cacheFirstTimer);
      },
    );
    blocTest<OnBoardingCubit, OnBoardingState>(
      'emits [CachingFirstTimer,onBoardingError] when unSuccessfull',
      build: () {
        when(() => cacheFirstTimer()).thenAnswer(
          (_) async => Left(
            tFailure,
          ),
        );
        return onBoardingCubit;
      },
      act: (onBoardingCubit) => onBoardingCubit.cacheFirstTimer(),
      expect: () => [
        const CachingFirstTimer(),
        OnBoardingError(message: tFailure.errorMessage),
      ],
      verify: (_) {
        verify(() => cacheFirstTimer()).called(1);
        verifyNoMoreInteractions(cacheFirstTimer);
      },
    );
  });
  group('checkIfUserIsFirstTimer', () {
    blocTest<OnBoardingCubit, OnBoardingState>(
      'emits [checkingIfUserISFirstTimer , OnBoardingStatus] when succeeded',
      build: () {
        when(() => checkIfUserIsFirstTimer()).thenAnswer(
          (_) async => const Right(false),
        );
        return onBoardingCubit;
      },
      act: (onBoardingCubit) => onBoardingCubit.checkIfUserIsFirstTimer(),
      expect: () => const [
        CheckingIfUserIsFirstTimer(),
        OnBoardingStatus(isFirstTimer: false)
      ],
      verify: (_) {
        verify(() => checkIfUserIsFirstTimer()).called(1);
        verifyNoMoreInteractions(checkIfUserIsFirstTimer);
      },
    );
    blocTest<OnBoardingCubit, OnBoardingState>(
      'emits [CheckingIfuserIsFirstTimer,onBoardingStatus(true)] '
      'when unSuccessfull',
      build: () {
        when(() => checkIfUserIsFirstTimer()).thenAnswer(
          (_) async => Left(
            tFailure,
          ),
        );
        return onBoardingCubit;
      },
      act: (onBoardingCubit) => onBoardingCubit.checkIfUserIsFirstTimer(),
      expect: () => [
        const CheckingIfUserIsFirstTimer(),
        const OnBoardingStatus(isFirstTimer: true),
      ],
      verify: (_) {
        verify(() => checkIfUserIsFirstTimer()).called(1);
        verifyNoMoreInteractions(checkIfUserIsFirstTimer);
      },
    );
  });
}
