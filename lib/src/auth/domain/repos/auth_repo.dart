// BluePrint of All Authentication Functions
import 'package:education_app_using_tdd/core/enums/update_user.dart';
import 'package:education_app_using_tdd/core/utills/typedef.dart';
import 'package:education_app_using_tdd/src/auth/domain/entities/user.dart';

abstract class AuthRepo {
  const AuthRepo();
  ResultFuture<void> forgotPassword(String email);
  ResultFuture<LocalUser> signIn({
    required String email,
    required String password,
  });
  ResultFuture<void> signUp({
    required String email,
    required String password,
    required String fullName,
  });

  ResultFuture<void> updateUser({
    required UpdateUserAction action,
    required dynamic userData,
  });
}
