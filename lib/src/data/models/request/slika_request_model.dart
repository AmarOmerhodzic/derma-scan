import 'package:freezed_annotation/freezed_annotation.dart';

part 'slika_request_model.freezed.dart';
part 'slika_request_model.g.dart';

@freezed
class SlikaRequest with _$SlikaRequest {
  factory SlikaRequest({
    required String korisnikId,
    required String albumId,
    required String slikaBaseEncoded,
    String? opis,
    String? rezultat,
    String? datumKreiranja,
  }) = _SlikaRequest;

  factory SlikaRequest.fromJson(Map<String, dynamic> json) =>
      _$SlikaRequestFromJson(json);
}
