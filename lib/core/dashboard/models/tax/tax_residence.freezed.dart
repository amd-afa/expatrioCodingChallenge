// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tax_residence.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaxResidence _$TaxResidenceFromJson(Map<String, dynamic> json) {
  return _TaxResidence.fromJson(json);
}

/// @nodoc
mixin _$TaxResidence {
  String? get country => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaxResidenceCopyWith<TaxResidence> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxResidenceCopyWith<$Res> {
  factory $TaxResidenceCopyWith(
          TaxResidence value, $Res Function(TaxResidence) then) =
      _$TaxResidenceCopyWithImpl<$Res, TaxResidence>;
  @useResult
  $Res call({String? country, String? id});
}

/// @nodoc
class _$TaxResidenceCopyWithImpl<$Res, $Val extends TaxResidence>
    implements $TaxResidenceCopyWith<$Res> {
  _$TaxResidenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaxResidenceImplCopyWith<$Res>
    implements $TaxResidenceCopyWith<$Res> {
  factory _$$TaxResidenceImplCopyWith(
          _$TaxResidenceImpl value, $Res Function(_$TaxResidenceImpl) then) =
      __$$TaxResidenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? country, String? id});
}

/// @nodoc
class __$$TaxResidenceImplCopyWithImpl<$Res>
    extends _$TaxResidenceCopyWithImpl<$Res, _$TaxResidenceImpl>
    implements _$$TaxResidenceImplCopyWith<$Res> {
  __$$TaxResidenceImplCopyWithImpl(
      _$TaxResidenceImpl _value, $Res Function(_$TaxResidenceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = freezed,
    Object? id = freezed,
  }) {
    return _then(_$TaxResidenceImpl(
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaxResidenceImpl implements _TaxResidence {
  const _$TaxResidenceImpl({this.country, this.id});

  factory _$TaxResidenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaxResidenceImplFromJson(json);

  @override
  final String? country;
  @override
  final String? id;

  @override
  String toString() {
    return 'TaxResidence(country: $country, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaxResidenceImpl &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, country, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaxResidenceImplCopyWith<_$TaxResidenceImpl> get copyWith =>
      __$$TaxResidenceImplCopyWithImpl<_$TaxResidenceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaxResidenceImplToJson(
      this,
    );
  }
}

abstract class _TaxResidence implements TaxResidence {
  const factory _TaxResidence({final String? country, final String? id}) =
      _$TaxResidenceImpl;

  factory _TaxResidence.fromJson(Map<String, dynamic> json) =
      _$TaxResidenceImpl.fromJson;

  @override
  String? get country;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$TaxResidenceImplCopyWith<_$TaxResidenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
