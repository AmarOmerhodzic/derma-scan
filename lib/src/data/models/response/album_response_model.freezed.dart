// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AlbumResponse _$AlbumResponseFromJson(Map<String, dynamic> json) {
  return _AlbumResponse.fromJson(json);
}

/// @nodoc
mixin _$AlbumResponse {
  String get id => throw _privateConstructorUsedError;
  String get korisnikId => throw _privateConstructorUsedError;
  String? get naziv => throw _privateConstructorUsedError;
  String get datumKreiranja => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumResponseCopyWith<AlbumResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumResponseCopyWith<$Res> {
  factory $AlbumResponseCopyWith(
          AlbumResponse value, $Res Function(AlbumResponse) then) =
      _$AlbumResponseCopyWithImpl<$Res, AlbumResponse>;
  @useResult
  $Res call(
      {String id, String korisnikId, String? naziv, String datumKreiranja});
}

/// @nodoc
class _$AlbumResponseCopyWithImpl<$Res, $Val extends AlbumResponse>
    implements $AlbumResponseCopyWith<$Res> {
  _$AlbumResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? korisnikId = null,
    Object? naziv = freezed,
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
      naziv: freezed == naziv
          ? _value.naziv
          : naziv // ignore: cast_nullable_to_non_nullable
              as String?,
      datumKreiranja: null == datumKreiranja
          ? _value.datumKreiranja
          : datumKreiranja // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlbumResponseImplCopyWith<$Res>
    implements $AlbumResponseCopyWith<$Res> {
  factory _$$AlbumResponseImplCopyWith(
          _$AlbumResponseImpl value, $Res Function(_$AlbumResponseImpl) then) =
      __$$AlbumResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String korisnikId, String? naziv, String datumKreiranja});
}

/// @nodoc
class __$$AlbumResponseImplCopyWithImpl<$Res>
    extends _$AlbumResponseCopyWithImpl<$Res, _$AlbumResponseImpl>
    implements _$$AlbumResponseImplCopyWith<$Res> {
  __$$AlbumResponseImplCopyWithImpl(
      _$AlbumResponseImpl _value, $Res Function(_$AlbumResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? korisnikId = null,
    Object? naziv = freezed,
    Object? datumKreiranja = null,
  }) {
    return _then(_$AlbumResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      korisnikId: null == korisnikId
          ? _value.korisnikId
          : korisnikId // ignore: cast_nullable_to_non_nullable
              as String,
      naziv: freezed == naziv
          ? _value.naziv
          : naziv // ignore: cast_nullable_to_non_nullable
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
class _$AlbumResponseImpl implements _AlbumResponse {
  _$AlbumResponseImpl(
      {required this.id,
      required this.korisnikId,
      this.naziv,
      required this.datumKreiranja});

  factory _$AlbumResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlbumResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String korisnikId;
  @override
  final String? naziv;
  @override
  final String datumKreiranja;

  @override
  String toString() {
    return 'AlbumResponse(id: $id, korisnikId: $korisnikId, naziv: $naziv, datumKreiranja: $datumKreiranja)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbumResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.korisnikId, korisnikId) ||
                other.korisnikId == korisnikId) &&
            (identical(other.naziv, naziv) || other.naziv == naziv) &&
            (identical(other.datumKreiranja, datumKreiranja) ||
                other.datumKreiranja == datumKreiranja));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, korisnikId, naziv, datumKreiranja);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlbumResponseImplCopyWith<_$AlbumResponseImpl> get copyWith =>
      __$$AlbumResponseImplCopyWithImpl<_$AlbumResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlbumResponseImplToJson(
      this,
    );
  }
}

abstract class _AlbumResponse implements AlbumResponse {
  factory _AlbumResponse(
      {required final String id,
      required final String korisnikId,
      final String? naziv,
      required final String datumKreiranja}) = _$AlbumResponseImpl;

  factory _AlbumResponse.fromJson(Map<String, dynamic> json) =
      _$AlbumResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get korisnikId;
  @override
  String? get naziv;
  @override
  String get datumKreiranja;
  @override
  @JsonKey(ignore: true)
  _$$AlbumResponseImplCopyWith<_$AlbumResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
