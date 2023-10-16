// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class LocalUser extends Equatable {
  final String uid;
  final String email;
  final String? profilePic;
  final String? bio;
  final int points;
  final String fullName;
  final List<String> groupIds;
  final List<String> enrolledCourcesIds;
  final List<String> followers;
  final List<String> followings;
  const LocalUser({
    required this.uid,
    required this.email,
    required this.points,
    required this.fullName,
    this.groupIds = const [],
    this.enrolledCourcesIds = const [],
    this.followers = const [],
    this.followings = const [],
    this.profilePic,
    this.bio,
  });

  @override
  List<Object?> get props => [uid, email];

  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'LocalUser{uid:$uid,email:$email,points:$points,bio:$bio,fullName:$fullName}';
  }

  const LocalUser.empty()
      : this(
          email: '',
          uid: '',
          points: 0,
          fullName: '',
          bio: '',
          profilePic: '',
          enrolledCourcesIds: const [],
          followers: const [],
          followings: const [],
          groupIds: const [],
        );
}
