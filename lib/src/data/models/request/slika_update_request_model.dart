import 'package:freezed_annotation/freezed_annotation.dart';

part 'slika_update_request_model.freezed.dart';
part 'slika_update_request_model.g.dart';

@freezed
class SlikaUpdateRequest with _$SlikaUpdateRequest {
  factory SlikaUpdateRequest({
    String? opis,
  }) = _SlikaUpdateRequest;

  factory SlikaUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$SlikaUpdateRequestFromJson(json);
}
