// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slika_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SlikaRequestImpl _$$SlikaRequestImplFromJson(Map<String, dynamic> json) =>
    _$SlikaRequestImpl(
      korisnikId: json['korisnikId'] as String,
      albumId: json['albumId'] as String,
      slikaBaseEncoded: json['slikaBaseEncoded'] as String,
      opis: json['opis'] as String?,
      rezultat: json['rezultat'] as String?,
      datumKreiranja: json['datumKreiranja'] as String?,
    );

Map<String, dynamic> _$$SlikaRequestImplToJson(_$SlikaRequestImpl instance) =>
    <String, dynamic>{
      'korisnikId': instance.korisnikId,
      'albumId': instance.albumId,
      'slikaBaseEncoded': instance.slikaBaseEncoded,
      'opis': instance.opis,
      'rezultat': instance.rezultat,
      'datumKreiranja': instance.datumKreiranja,
    };
