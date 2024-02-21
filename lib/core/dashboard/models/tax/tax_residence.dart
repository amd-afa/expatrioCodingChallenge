import 'package:freezed_annotation/freezed_annotation.dart';

part 'tax_residence.freezed.dart';
part 'tax_residence.g.dart';

@freezed
class TaxResidence with _$TaxResidence {
  const factory TaxResidence({
    String? country,
    String? id,
  }) = _TaxResidence;

  factory TaxResidence.fromJson(Map<String, dynamic> json) =>
      _$TaxResidenceFromJson(json);
}
