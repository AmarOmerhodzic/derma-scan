// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AlbumRequest _$AlbumRequestFromJson(Map<String, dynamic> json) {
  return _AlbumRequest.fromJson(json);
}

/// @nodoc
mixin _$AlbumRequest {
  String get korisnikId => throw _privateConstructorUsedError;
  String? get naziv => throw _privateConstructorUsedError;
  String? get datumKreiranja => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumRequestCopyWith<AlbumRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumRequestCopyWith<$Res> {
  factory $AlbumRequestCopyWith(
          AlbumRequest value, $Res Function(AlbumRequest) then) =
      _$AlbumRequestCopyWithImpl<$Res, AlbumRequest>;
  @useResult
  $Res call({String korisnikId, String? naziv, String? datumKreiranja});
}

/// @nodoc
class _$AlbumRequestCopyWithImpl<$Res, $Val extends AlbumRequest>
    implements $AlbumRequestCopyWith<$Res> {
  _$AlbumRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? korisnikId = null,
    Object? naziv = freezed,
    Object? datumKreiranja = freezed,
  }) {
    return _then(_value.copyWith(
      korisnikId: null == korisnikId
          ? _value.korisnikId
          : korisnikId // ignore: cast_nullable_to_non_nullable
              as String,
      naziv: freezed == naziv
          ? _value.naziv
          : naziv // ignore: cast_nullable_to_non_nullable
              as String?,
      datumKreiranja: freezed == datumKreiranja
          ? _value.datumKreiranja
          : datumKreiranja // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlbumRequestImplCopyWith<$Res>
    implements $AlbumRequestCopyWith<$Res> {
  factory _$$AlbumRequestImplCopyWith(
          _$AlbumRequestImpl value, $Res Function(_$AlbumRequestImpl) then) =
      __$$AlbumRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String korisnikId, String? naziv, String? datumKreiranja});
}

/// @nodoc
class __$$AlbumRequestImplCopyWithImpl<$Res>
    extends _$AlbumRequestCopyWithImpl<$Res, _$AlbumRequestImpl>
    implements _$$AlbumRequestImplCopyWith<$Res> {
  __$$AlbumRequestImplCopyWithImpl(
      _$AlbumRequestImpl _value, $Res Function(_$AlbumRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? korisnikId = null,
    Object? naziv = freezed,
    Object? datumKreiranja = freezed,
  }) {
    return _then(_$AlbumRequestImpl(
      korisnikId: null == korisnikId
          ? _value.korisnikId
          : korisnikId // ignore: cast_nullable_to_non_nullable
              as String,
      naziv: freezed == naziv
          ? _value.naziv
          : naziv // ignore: cast_nullable_to_non_nullable
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
class _$AlbumRequestImpl implements _AlbumRequest {
  _$AlbumRequestImpl(
      {required this.korisnikId, this.naziv, this.datumKreiranja});

  factory _$AlbumRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlbumRequestImplFromJson(json);

  @override
  final String korisnikId;
  @override
  final String? naziv;
  @override
  final String? datumKreiranja;

  @override
  String toString() {
    return 'AlbumRequest(korisnikId: $korisnikId, naziv: $naziv, datumKreiranja: $datumKreiranja)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbumRequestImpl &&
            (identical(other.korisnikId, korisnikId) ||
                other.korisnikId == korisnikId) &&
            (identical(other.naziv, naziv) || other.naziv == naziv) &&
            (identical(other.datumKreiranja, datumKreiranja) ||
                other.datumKreiranja == datumKreiranja));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, korisnikId, naziv, datumKreiranja);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlbumRequestImplCopyWith<_$AlbumRequestImpl> get copyWith =>
      __$$AlbumRequestImplCopyWithImpl<_$AlbumRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlbumRequestImplToJson(
      this,
    );
  }
}

abstract class _AlbumRequest implements AlbumRequest {
  factory _AlbumRequest(
      {required final String korisnikId,
      final String? naziv,
      final String? datumKreiranja}) = _$AlbumRequestImpl;

  factory _AlbumRequest.fromJson(Map<String, dynamic> json) =
      _$AlbumRequestImpl.fromJson;

  @override
  String get korisnikId;
  @override
  String? get naziv;
  @override
  String? get datumKreiranja;
  @override
  @JsonKey(ignore: true)
  _$$AlbumRequestImplCopyWith<_$AlbumRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
