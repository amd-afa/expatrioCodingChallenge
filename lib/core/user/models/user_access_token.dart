import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_access_token.freezed.dart';
part 'user_access_token.g.dart';

@freezed
class UserAccesToken with _$UserAccesToken {
  const factory UserAccesToken({
    String? accessToken,
    DateTime? accessTokenExpiresAt,
  }) = _UserAccesToken;

  factory UserAccesToken.fromJson(Map<String, Object?> json) =>
      _$UserAccesTokenFromJson(json);
}
