// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slika_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SlikaResponseImpl _$$SlikaResponseImplFromJson(Map<String, dynamic> json) =>
    _$SlikaResponseImpl(
      id: json['id'] as String,
      korisnikId: json['korisnikId'] as String,
      albumId: json['albumId'] as String,
      slikaBaseEncoded: json['slikaBaseEncoded'] as String,
      opis: json['opis'] as String?,
      rezultat: json['rezultat'] as String?,
      datumKreiranja: json['datumKreiranja'] as String,
    );

Map<String, dynamic> _$$SlikaResponseImplToJson(_$SlikaResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'korisnikId': instance.korisnikId,
      'albumId': instance.albumId,
      'slikaBaseEncoded': instance.slikaBaseEncoded,
      'opis': instance.opis,
      'rezultat': instance.rezultat,
      'datumKreiranja': instance.datumKreiranja,
    };
