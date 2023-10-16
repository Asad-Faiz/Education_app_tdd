import 'package:education_app_using_tdd/core/usecases/usecase.dart';
import 'package:education_app_using_tdd/core/utills/typedef.dart';
import 'package:education_app_using_tdd/src/auth/domain/repos/auth_repo.dart';

class ForgotPassword extends UsecaseWithParams<void, String> {
  const ForgotPassword._(this._repo);
  final AuthRepo _repo;

  @override
  ResultFuture<void> call(String params) {
    return _repo.forgotPassword(params);
  }
}
