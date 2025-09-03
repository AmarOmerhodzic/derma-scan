import 'package:freezed_annotation/freezed_annotation.dart';

part 'slika_response_model.freezed.dart';
part 'slika_response_model.g.dart';

@freezed
class SlikaResponse with _$SlikaResponse {
  factory SlikaResponse({
    required String id,
    required String korisnikId,
    required String albumId,
    required String slikaBaseEncoded,
    String? opis,
    String? rezultat,
    required String datumKreiranja,
  }) = _SlikaResponse;

  factory SlikaResponse.fromJson(Map<String, dynamic> json) =>
      _$SlikaResponseFromJson(json);
}
