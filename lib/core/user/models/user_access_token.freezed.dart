// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_access_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserAccesToken _$UserAccesTokenFromJson(Map<String, dynamic> json) {
  return _UserAccesToken.fromJson(json);
}

/// @nodoc
mixin _$UserAccesToken {
  String? get accessToken => throw _privateConstructorUsedError;
  DateTime? get accessTokenExpiresAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAccesTokenCopyWith<UserAccesToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAccesTokenCopyWith<$Res> {
  factory $UserAccesTokenCopyWith(
          UserAccesToken value, $Res Function(UserAccesToken) then) =
      _$UserAccesTokenCopyWithImpl<$Res, UserAccesToken>;
  @useResult
  $Res call({String? accessToken, DateTime? accessTokenExpiresAt});
}

/// @nodoc
class _$UserAccesTokenCopyWithImpl<$Res, $Val extends UserAccesToken>
    implements $UserAccesTokenCopyWith<$Res> {
  _$UserAccesTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? accessTokenExpiresAt = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      accessTokenExpiresAt: freezed == accessTokenExpiresAt
          ? _value.accessTokenExpiresAt
          : accessTokenExpiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAccesTokenImplCopyWith<$Res>
    implements $UserAccesTokenCopyWith<$Res> {
  factory _$$UserAccesTokenImplCopyWith(_$UserAccesTokenImpl value,
          $Res Function(_$UserAccesTokenImpl) then) =
      __$$UserAccesTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? accessToken, DateTime? accessTokenExpiresAt});
}

/// @nodoc
class __$$UserAccesTokenImplCopyWithImpl<$Res>
    extends _$UserAccesTokenCopyWithImpl<$Res, _$UserAccesTokenImpl>
    implements _$$UserAccesTokenImplCopyWith<$Res> {
  __$$UserAccesTokenImplCopyWithImpl(
      _$UserAccesTokenImpl _value, $Res Function(_$UserAccesTokenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? accessTokenExpiresAt = freezed,
  }) {
    return _then(_$UserAccesTokenImpl(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      accessTokenExpiresAt: freezed == accessTokenExpiresAt
          ? _value.accessTokenExpiresAt
          : accessTokenExpiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAccesTokenImpl implements _UserAccesToken {
  const _$UserAccesTokenImpl({this.accessToken, this.accessTokenExpiresAt});

  factory _$UserAccesTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAccesTokenImplFromJson(json);

  @override
  final String? accessToken;
  @override
  final DateTime? accessTokenExpiresAt;

  @override
  String toString() {
    return 'UserAccesToken(accessToken: $accessToken, accessTokenExpiresAt: $accessTokenExpiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAccesTokenImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.accessTokenExpiresAt, accessTokenExpiresAt) ||
                other.accessTokenExpiresAt == accessTokenExpiresAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, accessTokenExpiresAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAccesTokenImplCopyWith<_$UserAccesTokenImpl> get copyWith =>
      __$$UserAccesTokenImplCopyWithImpl<_$UserAccesTokenImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAccesTokenImplToJson(
      this,
    );
  }
}

abstract class _UserAccesToken implements UserAccesToken {
  const factory _UserAccesToken(
      {final String? accessToken,
      final DateTime? accessTokenExpiresAt}) = _$UserAccesTokenImpl;

  factory _UserAccesToken.fromJson(Map<String, dynamic> json) =
      _$UserAccesTokenImpl.fromJson;

  @override
  String? get accessToken;
  @override
  DateTime? get accessTokenExpiresAt;
  @override
  @JsonKey(ignore: true)
  _$$UserAccesTokenImplCopyWith<_$UserAccesTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
