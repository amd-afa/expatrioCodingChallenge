import 'package:coding_challenge/core/dashboard/models/tax/tax_residence.dart';
import 'package:coding_challenge/core/dashboard/models/tax/w_9_file.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_tax_data.freezed.dart';
part 'user_tax_data.g.dart';

@freezed
class UserTaxData with _$UserTaxData {
  const factory UserTaxData({
    required bool usPerson,
    String? usTaxId,
    required TaxResidence primaryTaxResidence,
    required List<TaxResidence> secondaryTaxResidence,
    required int w9FileId,
    required W9File w9File,
  }) = _UserTaxData;

  factory UserTaxData.fromJson(Map<String, dynamic> json) =>
      _$UserTaxDataFromJson(json);
}
