// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slika_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SlikaResponse _$SlikaResponseFromJson(Map<String, dynamic> json) {
  return _SlikaResponse.fromJson(json);
}

/// @nodoc
mixin _$SlikaResponse {
  String get id => throw _privateConstructorUsedError;
  String get korisnikId => throw _privateConstructorUsedError;
  String get albumId => throw _privateConstructorUsedError;
  String get slikaBaseEncoded => throw _privateConstructorUsedError;
  String? get opis => throw _privateConstructorUsedError;
  String? get rezultat => throw _privateConstructorUsedError;
  String get datumKreiranja => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SlikaResponseCopyWith<SlikaResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlikaResponseCopyWith<$Res> {
  factory $SlikaResponseCopyWith(
          SlikaResponse value, $Res Function(SlikaResponse) then) =
      _$SlikaResponseCopyWithImpl<$Res, SlikaResponse>;
  @useResult
  $Res call(
      {String id,
      String korisnikId,
      String albumId,
      String slikaBaseEncoded,
      String? opis,
      String? rezultat,
      String datumKreiranja});
}

/// @nodoc
class _$SlikaResponseCopyWithImpl<$Res, $Val extends SlikaResponse>
    implements $SlikaResponseCopyWith<$Res> {
  _$SlikaResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? korisnikId = null,
    Object? albumId = null,
    Object? slikaBaseEncoded = null,
    Object? opis = freezed,
    Object? rezultat = freezed,
    Object? datumKreiranja = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      korisnikId: null == korisnikId
          ? _value.korisnikId
          : korisnikId // ignore: cast_nullable_to_non_nullable
              as String,
      albumId: null == albumId
          ? _value.albumId
          : albumId // ignore: cast_nullable_to_non_nullable
              as String,
      slikaBaseEncoded: null == slikaBaseEncoded
          ? _value.slikaBaseEncoded
          : slikaBaseEncoded // ignore: cast_nullable_to_non_nullable
              as String,
      opis: freezed == opis
          ? _value.opis
          : opis // ignore: cast_nullable_to_non_nullable
              as String?,
      rezultat: freezed == rezultat
          ? _value.rezultat
          : rezultat // ignore: cast_nullable_to_non_nullable
              as String?,
      datumKreiranja: null == datumKreiranja
          ? _value.datumKreiranja
          : datumKreiranja // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SlikaResponseImplCopyWith<$Res>
    implements $SlikaResponseCopyWith<$Res> {
  factory _$$SlikaResponseImplCopyWith(
          _$SlikaResponseImpl value, $Res Function(_$SlikaResponseImpl) then) =
      __$$SlikaResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String korisnikId,
      String albumId,
      String slikaBaseEncoded,
      String? opis,
      String? rezultat,
      String datumKreiranja});
}

/// @nodoc
class __$$SlikaResponseImplCopyWithImpl<$Res>
    extends _$SlikaResponseCopyWithImpl<$Res, _$SlikaResponseImpl>
    implements _$$SlikaResponseImplCopyWith<$Res> {
  __$$SlikaResponseImplCopyWithImpl(
      _$SlikaResponseImpl _value, $Res Function(_$SlikaResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? korisnikId = null,
    Object? albumId = null,
    Object? slikaBaseEncoded = null,
    Object? opis = freezed,
    Object? rezultat = freezed,
    Object? datumKreiranja = null,
  }) {
    return _then(_$SlikaResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      korisnikId: null == korisnikId
          ? _value.korisnikId
          : korisnikId // ignore: cast_nullable_to_non_nullable
              as String,
      albumId: null == albumId
          ? _value.albumId
          : albumId // ignore: cast_nullable_to_non_nullable
              as String,
      slikaBaseEncoded: null == slikaBaseEncoded
          ? _value.slikaBaseEncoded
          : slikaBaseEncoded // ignore: cast_nullable_to_non_nullable
              as String,
      opis: freezed == opis
          ? _value.opis
          : opis // ignore: cast_nullable_to_non_nullable
              as String?,
      rezultat: freezed == rezultat
          ? _value.rezultat
          : rezultat // ignore: cast_nullable_to_non_nullable
              as String?,
      datumKreiranja: null == datumKreiranja
          ? _value.datumKreiranja
          : datumKreiranja // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SlikaResponseImpl implements _SlikaResponse {
  _$SlikaResponseImpl(
      {required this.id,
      required this.korisnikId,
      required this.albumId,
      required this.slikaBaseEncoded,
      this.opis,
      this.rezultat,
      required this.datumKreiranja});

  factory _$SlikaResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SlikaResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String korisnikId;
  @override
  final String albumId;
  @override
  final String slikaBaseEncoded;
  @override
  final String? opis;
  @override
  final String? rezultat;
  @override
  final String datumKreiranja;

  @override
  String toString() {
    return 'SlikaResponse(id: $id, korisnikId: $korisnikId, albumId: $albumId, slikaBaseEncoded: $slikaBaseEncoded, opis: $opis, rezultat: $rezultat, datumKreiranja: $datumKreiranja)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SlikaResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.korisnikId, korisnikId) ||
                other.korisnikId == korisnikId) &&
            (identical(other.albumId, albumId) || other.albumId == albumId) &&
            (identical(other.slikaBaseEncoded, slikaBaseEncoded) ||
                other.slikaBaseEncoded == slikaBaseEncoded) &&
            (identical(other.opis, opis) || other.opis == opis) &&
            (identical(other.rezultat, rezultat) ||
                other.rezultat == rezultat) &&
            (identical(other.datumKreiranja, datumKreiranja) ||
                other.datumKreiranja == datumKreiranja));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, korisnikId, albumId,
      slikaBaseEncoded, opis, rezultat, datumKreiranja);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SlikaResponseImplCopyWith<_$SlikaResponseImpl> get copyWith =>
      __$$SlikaResponseImplCopyWithImpl<_$SlikaResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SlikaResponseImplToJson(
      this,
    );
  }
}

abstract class _SlikaResponse implements SlikaResponse {
  factory _SlikaResponse(
      {required final String id,
      required final String korisnikId,
      required final String albumId,
      required final String slikaBaseEncoded,
      final String? opis,
      final String? rezultat,
      required final String datumKreiranja}) = _$SlikaResponseImpl;

  factory _SlikaResponse.fromJson(Map<String, dynamic> json) =
      _$SlikaResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get korisnikId;
  @override
  String get albumId;
  @override
  String get slikaBaseEncoded;
  @override
  String? get opis;
  @override
  String? get rezultat;
  @override
  String get datumKreiranja;
  @override
  @JsonKey(ignore: true)
  _$$SlikaResponseImplCopyWith<_$SlikaResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
