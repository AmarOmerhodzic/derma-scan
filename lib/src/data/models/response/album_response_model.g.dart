// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlbumResponseImpl _$$AlbumResponseImplFromJson(Map<String, dynamic> json) =>
    _$AlbumResponseImpl(
      id: json['id'] as String,
      korisnikId: json['korisnikId'] as String,
      naziv: json['naziv'] as String?,
      datumKreiranja: json['datumKreiranja'] as String,
    );

Map<String, dynamic> _$$AlbumResponseImplToJson(_$AlbumResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'korisnikId': instance.korisnikId,
      'naziv': instance.naziv,
      'datumKreiranja': instance.datumKreiranja,
    };
