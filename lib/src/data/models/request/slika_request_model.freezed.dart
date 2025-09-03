// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slika_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SlikaRequest _$SlikaRequestFromJson(Map<String, dynamic> json) {
  return _SlikaRequest.fromJson(json);
}

/// @nodoc
mixin _$SlikaRequest {
  String get korisnikId => throw _privateConstructorUsedError;
  String get albumId => throw _privateConstructorUsedError;
  String get slikaBaseEncoded => throw _privateConstructorUsedError;
  String? get opis => throw _privateConstructorUsedError;
  String? get rezultat => throw _privateConstructorUsedError;
  String? get datumKreiranja => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SlikaRequestCopyWith<SlikaRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlikaRequestCopyWith<$Res> {
  factory $SlikaRequestCopyWith(
          SlikaRequest value, $Res Function(SlikaRequest) then) =
      _$SlikaRequestCopyWithImpl<$Res, SlikaRequest>;
  @useResult
  $Res call(
      {String korisnikId,
      String albumId,
      String slikaBaseEncoded,
      String? opis,
      String? rezultat,
      String? datumKreiranja});
}

/// @nodoc
class _$SlikaRequestCopyWithImpl<$Res, $Val extends SlikaRequest>
    implements $SlikaRequestCopyWith<$Res> {
  _$SlikaRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? korisnikId = null,
    Object? albumId = null,
    Object? slikaBaseEncoded = null,
    Object? opis = freezed,
    Object? rezultat = freezed,
    Object? datumKreiranja = freezed,
  }) {
    return _then(_value.copyWith(
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
      datumKreiranja: freezed == datumKreiranja
          ? _value.datumKreiranja
          : datumKreiranja // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SlikaRequestImplCopyWith<$Res>
    implements $SlikaRequestCopyWith<$Res> {
  factory _$$SlikaRequestImplCopyWith(
          _$SlikaRequestImpl value, $Res Function(_$SlikaRequestImpl) then) =
      __$$SlikaRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String korisnikId,
      String albumId,
      String slikaBaseEncoded,
      String? opis,
      String? rezultat,
      String? datumKreiranja});
}

/// @nodoc
class __$$SlikaRequestImplCopyWithImpl<$Res>
    extends _$SlikaRequestCopyWithImpl<$Res, _$SlikaRequestImpl>
    implements _$$SlikaRequestImplCopyWith<$Res> {
  __$$SlikaRequestImplCopyWithImpl(
      _$SlikaRequestImpl _value, $Res Function(_$SlikaRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? korisnikId = null,
    Object? albumId = null,
    Object? slikaBaseEncoded = null,
    Object? opis = freezed,
    Object? rezultat = freezed,
    Object? datumKreiranja = freezed,
  }) {
    return _then(_$SlikaRequestImpl(
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
      datumKreiranja: freezed == datumKreiranja
          ? _value.datumKreiranja
          : datumKreiranja // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SlikaRequestImpl implements _SlikaRequest {
  _$SlikaRequestImpl(
      {required this.korisnikId,
      required this.albumId,
      required this.slikaBaseEncoded,
      this.opis,
      this.rezultat,
      this.datumKreiranja});

  factory _$SlikaRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SlikaRequestImplFromJson(json);

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
  final String? datumKreiranja;

  @override
  String toString() {
    return 'SlikaRequest(korisnikId: $korisnikId, albumId: $albumId, slikaBaseEncoded: $slikaBaseEncoded, opis: $opis, rezultat: $rezultat, datumKreiranja: $datumKreiranja)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SlikaRequestImpl &&
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
  int get hashCode => Object.hash(runtimeType, korisnikId, albumId,
      slikaBaseEncoded, opis, rezultat, datumKreiranja);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SlikaRequestImplCopyWith<_$SlikaRequestImpl> get copyWith =>
      __$$SlikaRequestImplCopyWithImpl<_$SlikaRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SlikaRequestImplToJson(
      this,
    );
  }
}

abstract class _SlikaRequest implements SlikaRequest {
  factory _SlikaRequest(
      {required final String korisnikId,
      required final String albumId,
      required final String slikaBaseEncoded,
      final String? opis,
      final String? rezultat,
      final String? datumKreiranja}) = _$SlikaRequestImpl;

  factory _SlikaRequest.fromJson(Map<String, dynamic> json) =
      _$SlikaRequestImpl.fromJson;

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
  String? get datumKreiranja;
  @override
  @JsonKey(ignore: true)
  _$$SlikaRequestImplCopyWith<_$SlikaRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
