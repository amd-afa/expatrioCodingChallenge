// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'w_9_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$W9FileImpl _$$W9FileImplFromJson(Map<String, dynamic> json) => _$W9FileImpl(
      id: json['id'] as int,
      createdAt: json['createdAt'] as String,
      modifiedAt: json['modifiedAt'] as String,
      fileName: json['fileName'] as String,
      dataType: json['dataType'] as String,
      fileUrl: json['fileUrl'] as String,
      invalid: json['invalid'] as bool?,
    );

Map<String, dynamic> _$$W9FileImplToJson(_$W9FileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'modifiedAt': instance.modifiedAt,
      'fileName': instance.fileName,
      'dataType': instance.dataType,
      'fileUrl': instance.fileUrl,
      'invalid': instance.invalid,
    };