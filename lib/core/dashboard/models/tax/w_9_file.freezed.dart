// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'w_9_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

W9File _$W9FileFromJson(Map<String, dynamic> json) {
  return _W9File.fromJson(json);
}

/// @nodoc
mixin _$W9File {
  int get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get modifiedAt => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  String get dataType => throw _privateConstructorUsedError;
  String get fileUrl => throw _privateConstructorUsedError;
  bool? get invalid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $W9FileCopyWith<W9File> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $W9FileCopyWith<$Res> {
  factory $W9FileCopyWith(W9File value, $Res Function(W9File) then) =
      _$W9FileCopyWithImpl<$Res, W9File>;
  @useResult
  $Res call(
      {int id,
      String createdAt,
      String modifiedAt,
      String fileName,
      String dataType,
      String fileUrl,
      bool? invalid});
}

/// @nodoc
class _$W9FileCopyWithImpl<$Res, $Val extends W9File>
    implements $W9FileCopyWith<$Res> {
  _$W9FileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? modifiedAt = null,
    Object? fileName = null,
    Object? dataType = null,
    Object? fileUrl = null,
    Object? invalid = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedAt: null == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      dataType: null == dataType
          ? _value.dataType
          : dataType // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      invalid: freezed == invalid
          ? _value.invalid
          : invalid // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$W9FileImplCopyWith<$Res> implements $W9FileCopyWith<$Res> {
  factory _$$W9FileImplCopyWith(
          _$W9FileImpl value, $Res Function(_$W9FileImpl) then) =
      __$$W9FileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String createdAt,
      String modifiedAt,
      String fileName,
      String dataType,
      String fileUrl,
      bool? invalid});
}

/// @nodoc
class __$$W9FileImplCopyWithImpl<$Res>
    extends _$W9FileCopyWithImpl<$Res, _$W9FileImpl>
    implements _$$W9FileImplCopyWith<$Res> {
  __$$W9FileImplCopyWithImpl(
      _$W9FileImpl _value, $Res Function(_$W9FileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? modifiedAt = null,
    Object? fileName = null,
    Object? dataType = null,
    Object? fileUrl = null,
    Object? invalid = freezed,
  }) {
    return _then(_$W9FileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedAt: null == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      dataType: null == dataType
          ? _value.dataType
          : dataType // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      invalid: freezed == invalid
          ? _value.invalid
          : invalid // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$W9FileImpl implements _W9File {
  const _$W9FileImpl(
      {required this.id,
      required this.createdAt,
      required this.modifiedAt,
      required this.fileName,
      required this.dataType,
      required this.fileUrl,
      this.invalid});

  factory _$W9FileImpl.fromJson(Map<String, dynamic> json) =>
      _$$W9FileImplFromJson(json);

  @override
  final int id;
  @override
  final String createdAt;
  @override
  final String modifiedAt;
  @override
  final String fileName;
  @override
  final String dataType;
  @override
  final String fileUrl;
  @override
  final bool? invalid;

  @override
  String toString() {
    return 'W9File(id: $id, createdAt: $createdAt, modifiedAt: $modifiedAt, fileName: $fileName, dataType: $dataType, fileUrl: $fileUrl, invalid: $invalid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$W9FileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.dataType, dataType) ||
                other.dataType == dataType) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.invalid, invalid) || other.invalid == invalid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, modifiedAt,
      fileName, dataType, fileUrl, invalid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$W9FileImplCopyWith<_$W9FileImpl> get copyWith =>
      __$$W9FileImplCopyWithImpl<_$W9FileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$W9FileImplToJson(
      this,
    );
  }
}

abstract class _W9File implements W9File {
  const factory _W9File(
      {required final int id,
      required final String createdAt,
      required final String modifiedAt,
      required final String fileName,
      required final String dataType,
      required final String fileUrl,
      final bool? invalid}) = _$W9FileImpl;

  factory _W9File.fromJson(Map<String, dynamic> json) = _$W9FileImpl.fromJson;

  @override
  int get id;
  @override
  String get createdAt;
  @override
  String get modifiedAt;
  @override
  String get fileName;
  @override
  String get dataType;
  @override
  String get fileUrl;
  @override
  bool? get invalid;
  @override
  @JsonKey(ignore: true)
  _$$W9FileImplCopyWith<_$W9FileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
