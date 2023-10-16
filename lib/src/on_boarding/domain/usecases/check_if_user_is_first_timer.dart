import 'package:education_app_using_tdd/core/usecases/usecase.dart';
import 'package:education_app_using_tdd/core/utills/typedef.dart';
import 'package:education_app_using_tdd/src/on_boarding/domain/repos/on_boarding_repo.dart';

class CheckIfUserIsFirstTimer extends UsecaseWithoutParams<bool> {
  const CheckIfUserIsFirstTimer(this._repo);
  final OnBoardingRepo _repo;

  @override
  ResultFuture<bool> call() => _repo.checkIfUserIsFirstTimer();
}
