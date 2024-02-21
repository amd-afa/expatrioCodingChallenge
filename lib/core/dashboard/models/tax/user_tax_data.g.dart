// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_tax_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserTaxDataImpl _$$UserTaxDataImplFromJson(Map<String, dynamic> json) =>
    _$UserTaxDataImpl(
      usPerson: json['usPerson'] as bool,
      usTaxId: json['usTaxId'] as String?,
      primaryTaxResidence: TaxResidence.fromJson(
          json['primaryTaxResidence'] as Map<String, dynamic>),
      secondaryTaxResidence: (json['secondaryTaxResidence'] as List<dynamic>)
          .map((e) => TaxResidence.fromJson(e as Map<String, dynamic>))
          .toList(),
      w9FileId: json['w9FileId'] as int,
      w9File: W9File.fromJson(json['w9File'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserTaxDataImplToJson(_$UserTaxDataImpl instance) =>
    <String, dynamic>{
      'usPerson': instance.usPerson,
      'usTaxId': instance.usTaxId,
      'primaryTaxResidence': instance.primaryTaxResidence,
      'secondaryTaxResidence': instance.secondaryTaxResidence,
      'w9FileId': instance.w9FileId,
      'w9File': instance.w9File,
    };
