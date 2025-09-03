import 'package:freezed_annotation/freezed_annotation.dart';

part 'album_response_model.freezed.dart';
part 'album_response_model.g.dart';

@freezed
class AlbumResponse with _$AlbumResponse {
  factory AlbumResponse({
    required String id,
    required String korisnikId,
    String? naziv,
    required String datumKreiranja,
  }) = _AlbumResponse;

  factory AlbumResponse.fromJson(Map<String, dynamic> json) =>
      _$AlbumResponseFromJson(json);
}
