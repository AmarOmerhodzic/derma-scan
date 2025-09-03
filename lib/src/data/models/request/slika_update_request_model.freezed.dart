// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slika_update_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SlikaUpdateRequest _$SlikaUpdateRequestFromJson(Map<String, dynamic> json) {
  return _SlikaUpdateRequest.fromJson(json);
}

/// @nodoc
mixin _$SlikaUpdateRequest {
  String? get opis => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SlikaUpdateRequestCopyWith<SlikaUpdateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlikaUpdateRequestCopyWith<$Res> {
  factory $SlikaUpdateRequestCopyWith(
          SlikaUpdateRequest value, $Res Function(SlikaUpdateRequest) then) =
      _$SlikaUpdateRequestCopyWithImpl<$Res, SlikaUpdateRequest>;
  @useResult
  $Res call({String? opis});
}

/// @nodoc
class _$SlikaUpdateRequestCopyWithImpl<$Res, $Val extends SlikaUpdateRequest>
    implements $SlikaUpdateRequestCopyWith<$Res> {
  _$SlikaUpdateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? opis = freezed,
  }) {
    return _then(_value.copyWith(
      opis: freezed == opis
          ? _value.opis
          : opis // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SlikaUpdateRequestImplCopyWith<$Res>
    implements $SlikaUpdateRequestCopyWith<$Res> {
  factory _$$SlikaUpdateRequestImplCopyWith(_$SlikaUpdateRequestImpl value,
          $Res Function(_$SlikaUpdateRequestImpl) then) =
      __$$SlikaUpdateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? opis});
}

/// @nodoc
class __$$SlikaUpdateRequestImplCopyWithImpl<$Res>
    extends _$SlikaUpdateRequestCopyWithImpl<$Res, _$SlikaUpdateRequestImpl>
    implements _$$SlikaUpdateRequestImplCopyWith<$Res> {
  __$$SlikaUpdateRequestImplCopyWithImpl(_$SlikaUpdateRequestImpl _value,
      $Res Function(_$SlikaUpdateRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? opis = freezed,
  }) {
    return _then(_$SlikaUpdateRequestImpl(
      opis: freezed == opis
          ? _value.opis
          : opis // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SlikaUpdateRequestImpl implements _SlikaUpdateRequest {
  _$SlikaUpdateRequestImpl({this.opis});

  factory _$SlikaUpdateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SlikaUpdateRequestImplFromJson(json);

  @override
  final String? opis;

  @override
  String toString() {
    return 'SlikaUpdateRequest(opis: $opis)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SlikaUpdateRequestImpl &&
            (identical(other.opis, opis) || other.opis == opis));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, opis);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SlikaUpdateRequestImplCopyWith<_$SlikaUpdateRequestImpl> get copyWith =>
      __$$SlikaUpdateRequestImplCopyWithImpl<_$SlikaUpdateRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SlikaUpdateRequestImplToJson(
      this,
    );
  }
}

abstract class _SlikaUpdateRequest implements SlikaUpdateRequest {
  factory _SlikaUpdateRequest({final String? opis}) = _$SlikaUpdateRequestImpl;

  factory _SlikaUpdateRequest.fromJson(Map<String, dynamic> json) =
      _$SlikaUpdateRequestImpl.fromJson;

  @override
  String? get opis;
  @override
  @JsonKey(ignore: true)
  _$$SlikaUpdateRequestImplCopyWith<_$SlikaUpdateRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
