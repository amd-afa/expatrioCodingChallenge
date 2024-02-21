import 'package:freezed_annotation/freezed_annotation.dart';

part 'w_9_file.freezed.dart';
part 'w_9_file.g.dart';

@freezed
class W9File with _$W9File {
  const factory W9File({
    required int id,
    required String createdAt,
    required String modifiedAt,
    required String fileName,
    required String dataType,
    required String fileUrl,
    bool? invalid,
  }) = _W9File;

  factory W9File.fromJson(Map<String, dynamic> json) => _$W9FileFromJson(json);
}
