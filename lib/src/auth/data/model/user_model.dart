import 'package:education_app_using_tdd/core/utills/typedef.dart';
import 'package:education_app_using_tdd/src/auth/domain/entities/user.dart';

class LocalUserModel extends LocalUser {
  const LocalUserModel({
    required super.uid,
    required super.email,
    required super.points,
    required super.fullName,
    super.groupIds = const [],
    super.enrolledCourcesIds = const [],
    super.followers = const [],
    super.followings = const [],
    super.profilePic,
    super.bio,
  });
  const LocalUserModel.empty()
      : this(email: '', fullName: '', points: 0, uid: '');
  LocalUserModel.fromMap(DataMap map)
      : super(
          uid: map['uid'] as String,
          email: map['email'] as String,
          fullName: map['fullName'] as String,
          profilePic: map['profilePic'] as String?,
          points: (map['points'] as num).toInt(),
          groupIds: (map['groupIds'] as List<dynamic>).cast<String>(),
          followers: (map['followers'] as List<dynamic>).cast<String>(),
          followings: (map['followings'] as List<dynamic>).cast<String>(),
          enrolledCourcesIds:
              (map['enrolledCourcesIds'] as List<dynamic>).cast<String>(),
        );
  DataMap toMap() {
    return {
      'uid': uid,
      'email': email,
      'profilePic': profilePic,
      'bio': bio,
      'points': points,
      'fullName': fullName,
      'groupIds': groupIds,
      'enrolledCourcesIds': enrolledCourcesIds,
      'followers': followers,
      'followings': followings,
    };
  }

  LocalUser copyWith({
    String? uid,
    String? email,
    String? profilePic,
    String? bio,
    int? points,
    String? fullName,
    List<String>? groupIds,
    List<String>? enrolledCourcesIds,
    List<String>? followers,
    List<String>? followings,
  }) {
    return LocalUser(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      profilePic: profilePic ?? this.profilePic,
      bio: bio ?? this.bio,
      points: points ?? this.points,
      fullName: fullName ?? this.fullName,
      groupIds: groupIds ?? this.groupIds,
      enrolledCourcesIds: enrolledCourcesIds ?? this.enrolledCourcesIds,
      followers: followers ?? this.followers,
      followings: followings ?? this.followings,
    );
  }
}
