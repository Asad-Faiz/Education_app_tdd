// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:education_app_using_tdd/core/enums/update_user.dart';
import 'package:education_app_using_tdd/core/usecases/usecase.dart';
import 'package:education_app_using_tdd/core/utills/typedef.dart';
import 'package:education_app_using_tdd/src/auth/domain/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';

class UpdateUser extends UsecaseWithParams<void, UpdateUserparams> {
  const UpdateUser(this._repo);
  final AuthRepo _repo;

  @override
  ResultFuture<void> call(UpdateUserparams params) {
    return _repo.updateUser(action: params.action, userData: params.userData);
  }
}

class UpdateUserparams extends Equatable {
  final UpdateUserAction action;
  final dynamic userData;

  const UpdateUserparams({
    required this.action,
    required this.userData,
  });
  const UpdateUserparams.empty()
      : this(action: UpdateUserAction.displayName, userData: '');

  @override
  List<Object?> get props => [action, userData];
}
