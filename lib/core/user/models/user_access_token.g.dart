// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_access_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAccesTokenImpl _$$UserAccesTokenImplFromJson(Map<String, dynamic> json) =>
    _$UserAccesTokenImpl(
      accessToken: json['accessToken'] as String?,
      accessTokenExpiresAt: json['accessTokenExpiresAt'] == null
          ? null
          : DateTime.parse(json['accessTokenExpiresAt'] as String),
    );

Map<String, dynamic> _$$UserAccesTokenImplToJson(
        _$UserAccesTokenImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'accessTokenExpiresAt': instance.accessTokenExpiresAt?.toIso8601String(),
    };
