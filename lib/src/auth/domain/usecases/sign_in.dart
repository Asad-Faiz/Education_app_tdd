import 'package:education_app_using_tdd/core/usecases/usecase.dart';
import 'package:education_app_using_tdd/core/utills/typedef.dart';
import 'package:education_app_using_tdd/src/auth/domain/entities/user.dart';
import 'package:education_app_using_tdd/src/auth/domain/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';

class SignIn extends UsecaseWithParams<LocalUser, SignInParams> {
  const SignIn(this._repo);
  final AuthRepo _repo;

  @override
  ResultFuture<LocalUser> call(SignInParams params) {
    return _repo.signIn(email: params.email, password: params.password);
  }
}

class SignInParams extends Equatable {
  const SignInParams({
    required this.email,
    required this.password,
  });
  const SignInParams.empty() : this(email: '', password: '');
  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}