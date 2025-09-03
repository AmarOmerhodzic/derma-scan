import 'package:freezed_annotation/freezed_annotation.dart';

part 'album_request_model.freezed.dart';
part 'album_request_model.g.dart';

@freezed
class AlbumRequest with _$AlbumRequest {
  factory AlbumRequest({
    required String korisnikId,
    String? naziv,
    String? datumKreiranja, // ISO8601 format (yyyy-MM-dd)
  }) = _AlbumRequest;

  factory AlbumRequest.fromJson(Map<String, dynamic> json) =>
      _$AlbumRequestFromJson(json);
}
