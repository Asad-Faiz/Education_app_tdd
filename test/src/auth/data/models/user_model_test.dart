import 'dart:convert';
import 'dart:math';

import 'package:education_app_using_tdd/core/utills/typedef.dart';
import 'package:education_app_using_tdd/src/auth/data/model/user_model.dart';
import 'package:education_app_using_tdd/src/auth/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tLocalUserModel = LocalUserModel.empty();
  LocalUser user = tLocalUserModel;
  test('LocalUserModel is subclass of LocalUser', () {
    expect(tLocalUserModel, isA<LocalUser>());
  });
  final tMap = jsonDecode(fixture('user.json')) as DataMap;
  group(
    'from Map',
    () {
      test(
        'should return a valid [LocalUserModel] from the map',
        () {
          final result = LocalUserModel.fromMap(tMap);
          // expect(result, isA<LocalUserModel>());
          expect(result, equals(tLocalUserModel));
        },
      );
      test('should throw an erro when map is invalid', () {
        final map = DataMap.from(tMap)..remove('uid');

        const call = LocalUserModel.fromMap;
        expect(() => call(map), throwsA(isA<Error>()));
      });
    },
  );
  group(
    'toMap',
    () {
      test(
        'should return a valid [DatMap] from the Model',
        () {
          final result = tLocalUserModel.toMap();
          // expect(result, isA<LocalUserModel>());
          expect(result, equals(tMap));
        },
      );
    },
  );

  group('coptWith', () {
    test('should return a valid [LocalUserModel] with updated Values', () {
      final result = tLocalUserModel.copyWith(uid: '2');
      expect(result.uid, '2');
    });
  });
}
