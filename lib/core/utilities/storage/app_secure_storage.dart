import 'dart:convert';

import 'package:coding_challenge/core/user/models/user.dart';
import 'package:coding_challenge/core/user/models/user_access_token.dart';
import 'package:coding_challenge/core/utilities/dependency_injection/get_it_config.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AppSecureStorage {
  final secureStorage = getIt<FlutterSecureStorage>();

  final String userAccessTokenKey = 'accessToken';
  final String userKey = 'user';

  Future<void> setUserAccessToken(UserAccesToken userAccessToken) async {
    await secureStorage.write(
      key: userAccessTokenKey,
      value: jsonEncode(
        userAccessToken.toJson(),
      ),
    );
  }

  Future<UserAccesToken?> getUserAccessToken() async {
    return await secureStorage.read(key: userAccessTokenKey).then(
      (data) {
        return (data != null)
            ? UserAccesToken.fromJson(
                jsonDecode(data),
              )
            : null;
      },
    );
  }

  Future<void> setUserData(User user) async {
    await secureStorage.write(
      key: userKey,
      value: jsonEncode(
        user.toJson(),
      ),
    );
  }

  Future<User?> getUserData() async {
    return await secureStorage.read(key: userKey).then(
      (data) {
        return (data != null)
            ? User.fromJson(
                jsonDecode(data),
              )
            : null;
      },
    );
  }
}
