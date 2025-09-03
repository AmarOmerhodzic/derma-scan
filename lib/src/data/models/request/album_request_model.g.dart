// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlbumRequestImpl _$$AlbumRequestImplFromJson(Map<String, dynamic> json) =>
    _$AlbumRequestImpl(
      korisnikId: json['korisnikId'] as String,
      naziv: json['naziv'] as String?,
      datumKreiranja: json['datumKreiranja'] as String?,
    );

Map<String, dynamic> _$$AlbumRequestImplToJson(_$AlbumRequestImpl instance) =>
    <String, dynamic>{
      'korisnikId': instance.korisnikId,
      'naziv': instance.naziv,
      'datumKreiranja': instance.datumKreiranja,
    };
