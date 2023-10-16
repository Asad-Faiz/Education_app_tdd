import 'package:education_app_using_tdd/core/usecases/usecase.dart';
import 'package:education_app_using_tdd/core/utills/typedef.dart';
import 'package:education_app_using_tdd/src/auth/domain/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';

class SignUp extends UsecaseWithParams<void, SignUpParams> {
  const SignUp(this._repo);
  final AuthRepo _repo;

  @override
  ResultFuture<void> call(SignUpParams params) {
    return _repo.signUp(
      email: params.email,
      password: params.password,
      fullName: params.fullName,
    );
  }
}

class SignUpParams extends Equatable {
  const SignUpParams({
    required this.email,
    required this.fullName,
    required this.password,
  });
  const SignUpParams.empty() : this(email: '', password: '', fullName: '');

  final String email;
  final String fullName;
  final String password;

  @override
  List<Object?> get props => [email, password, fullName];
}
