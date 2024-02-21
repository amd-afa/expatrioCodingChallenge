// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_tax_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserTaxData _$UserTaxDataFromJson(Map<String, dynamic> json) {
  return _UserTaxData.fromJson(json);
}

/// @nodoc
mixin _$UserTaxData {
  bool get usPerson => throw _privateConstructorUsedError;
  String? get usTaxId => throw _privateConstructorUsedError;
  TaxResidence get primaryTaxResidence => throw _privateConstructorUsedError;
  List<TaxResidence> get secondaryTaxResidence =>
      throw _privateConstructorUsedError;
  int get w9FileId => throw _privateConstructorUsedError;
  W9File get w9File => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserTaxDataCopyWith<UserTaxData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserTaxDataCopyWith<$Res> {
  factory $UserTaxDataCopyWith(
          UserTaxData value, $Res Function(UserTaxData) then) =
      _$UserTaxDataCopyWithImpl<$Res, UserTaxData>;
  @useResult
  $Res call(
      {bool usPerson,
      String? usTaxId,
      TaxResidence primaryTaxResidence,
      List<TaxResidence> secondaryTaxResidence,
      int w9FileId,
      W9File w9File});

  $TaxResidenceCopyWith<$Res> get primaryTaxResidence;
  $W9FileCopyWith<$Res> get w9File;
}

/// @nodoc
class _$UserTaxDataCopyWithImpl<$Res, $Val extends UserTaxData>
    implements $UserTaxDataCopyWith<$Res> {
  _$UserTaxDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usPerson = null,
    Object? usTaxId = freezed,
    Object? primaryTaxResidence = null,
    Object? secondaryTaxResidence = null,
    Object? w9FileId = null,
    Object? w9File = null,
  }) {
    return _then(_value.copyWith(
      usPerson: null == usPerson
          ? _value.usPerson
          : usPerson // ignore: cast_nullable_to_non_nullable
              as bool,
      usTaxId: freezed == usTaxId
          ? _value.usTaxId
          : usTaxId // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryTaxResidence: null == primaryTaxResidence
          ? _value.primaryTaxResidence
          : primaryTaxResidence // ignore: cast_nullable_to_non_nullable
              as TaxResidence,
      secondaryTaxResidence: null == secondaryTaxResidence
          ? _value.secondaryTaxResidence
          : secondaryTaxResidence // ignore: cast_nullable_to_non_nullable
              as List<TaxResidence>,
      w9FileId: null == w9FileId
          ? _value.w9FileId
          : w9FileId // ignore: cast_nullable_to_non_nullable
              as int,
      w9File: null == w9File
          ? _value.w9File
          : w9File // ignore: cast_nullable_to_non_nullable
              as W9File,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TaxResidenceCopyWith<$Res> get primaryTaxResidence {
    return $TaxResidenceCopyWith<$Res>(_value.primaryTaxResidence, (value) {
      return _then(_value.copyWith(primaryTaxResidence: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $W9FileCopyWith<$Res> get w9File {
    return $W9FileCopyWith<$Res>(_value.w9File, (value) {
      return _then(_value.copyWith(w9File: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserTaxDataImplCopyWith<$Res>
    implements $UserTaxDataCopyWith<$Res> {
  factory _$$UserTaxDataImplCopyWith(
          _$UserTaxDataImpl value, $Res Function(_$UserTaxDataImpl) then) =
      __$$UserTaxDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool usPerson,
      String? usTaxId,
      TaxResidence primaryTaxResidence,
      List<TaxResidence> secondaryTaxResidence,
      int w9FileId,
      W9File w9File});

  @override
  $TaxResidenceCopyWith<$Res> get primaryTaxResidence;
  @override
  $W9FileCopyWith<$Res> get w9File;
}

/// @nodoc
class __$$UserTaxDataImplCopyWithImpl<$Res>
    extends _$UserTaxDataCopyWithImpl<$Res, _$UserTaxDataImpl>
    implements _$$UserTaxDataImplCopyWith<$Res> {
  __$$UserTaxDataImplCopyWithImpl(
      _$UserTaxDataImpl _value, $Res Function(_$UserTaxDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usPerson = null,
    Object? usTaxId = freezed,
    Object? primaryTaxResidence = null,
    Object? secondaryTaxResidence = null,
    Object? w9FileId = null,
    Object? w9File = null,
  }) {
    return _then(_$UserTaxDataImpl(
      usPerson: null == usPerson
          ? _value.usPerson
          : usPerson // ignore: cast_nullable_to_non_nullable
              as bool,
      usTaxId: freezed == usTaxId
          ? _value.usTaxId
          : usTaxId // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryTaxResidence: null == primaryTaxResidence
          ? _value.primaryTaxResidence
          : primaryTaxResidence // ignore: cast_nullable_to_non_nullable
              as TaxResidence,
      secondaryTaxResidence: null == secondaryTaxResidence
          ? _value._secondaryTaxResidence
          : secondaryTaxResidence // ignore: cast_nullable_to_non_nullable
              as List<TaxResidence>,
      w9FileId: null == w9FileId
          ? _value.w9FileId
          : w9FileId // ignore: cast_nullable_to_non_nullable
              as int,
      w9File: null == w9File
          ? _value.w9File
          : w9File // ignore: cast_nullable_to_non_nullable
              as W9File,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserTaxDataImpl implements _UserTaxData {
  const _$UserTaxDataImpl(
      {required this.usPerson,
      this.usTaxId,
      required this.primaryTaxResidence,
      required final List<TaxResidence> secondaryTaxResidence,
      required this.w9FileId,
      required this.w9File})
      : _secondaryTaxResidence = secondaryTaxResidence;

  factory _$UserTaxDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserTaxDataImplFromJson(json);

  @override
  final bool usPerson;
  @override
  final String? usTaxId;
  @override
  final TaxResidence primaryTaxResidence;
  final List<TaxResidence> _secondaryTaxResidence;
  @override
  List<TaxResidence> get secondaryTaxResidence {
    if (_secondaryTaxResidence is EqualUnmodifiableListView)
      return _secondaryTaxResidence;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_secondaryTaxResidence);
  }

  @override
  final int w9FileId;
  @override
  final W9File w9File;

  @override
  String toString() {
    return 'UserTaxData(usPerson: $usPerson, usTaxId: $usTaxId, primaryTaxResidence: $primaryTaxResidence, secondaryTaxResidence: $secondaryTaxResidence, w9FileId: $w9FileId, w9File: $w9File)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserTaxDataImpl &&
            (identical(other.usPerson, usPerson) ||
                other.usPerson == usPerson) &&
            (identical(other.usTaxId, usTaxId) || other.usTaxId == usTaxId) &&
            (identical(other.primaryTaxResidence, primaryTaxResidence) ||
                other.primaryTaxResidence == primaryTaxResidence) &&
            const DeepCollectionEquality()
                .equals(other._secondaryTaxResidence, _secondaryTaxResidence) &&
            (identical(other.w9FileId, w9FileId) ||
                other.w9FileId == w9FileId) &&
            (identical(other.w9File, w9File) || other.w9File == w9File));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      usPerson,
      usTaxId,
      primaryTaxResidence,
      const DeepCollectionEquality().hash(_secondaryTaxResidence),
      w9FileId,
      w9File);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserTaxDataImplCopyWith<_$UserTaxDataImpl> get copyWith =>
      __$$UserTaxDataImplCopyWithImpl<_$UserTaxDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserTaxDataImplToJson(
      this,
    );
  }
}

abstract class _UserTaxData implements UserTaxData {
  const factory _UserTaxData(
      {required final bool usPerson,
      final String? usTaxId,
      required final TaxResidence primaryTaxResidence,
      required final List<TaxResidence> secondaryTaxResidence,
      required final int w9FileId,
      required final W9File w9File}) = _$UserTaxDataImpl;

  factory _UserTaxData.fromJson(Map<String, dynamic> json) =
      _$UserTaxDataImpl.fromJson;

  @override
  bool get usPerson;
  @override
  String? get usTaxId;
  @override
  TaxResidence get primaryTaxResidence;
  @override
  List<TaxResidence> get secondaryTaxResidence;
  @override
  int get w9FileId;
  @override
  W9File get w9File;
  @override
  @JsonKey(ignore: true)
  _$$UserTaxDataImplCopyWith<_$UserTaxDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
