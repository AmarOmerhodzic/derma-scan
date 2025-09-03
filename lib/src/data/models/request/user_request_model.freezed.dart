// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserRequest _$UserRequestFromJson(Map<String, dynamic> json) {
  return _UserRequest.fromJson(json);
}

/// @nodoc
mixin _$UserRequest {
  String get id => throw _privateConstructorUsedError;
  String? get datumKreiranja => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRequestCopyWith<UserRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRequestCopyWith<$Res> {
  factory $UserRequestCopyWith(
          UserRequest value, $Res Function(UserRequest) then) =
      _$UserRequestCopyWithImpl<$Res, UserRequest>;
  @useResult
  $Res call({String id, String? datumKreiranja});
}

/// @nodoc
class _$UserRequestCopyWithImpl<$Res, $Val extends UserRequest>
    implements $UserRequestCopyWith<$Res> {
  _$UserRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? datumKreiranja = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      datumKreiranja: freezed == datumKreiranja
          ? _value.datumKreiranja
          : datumKreiranja // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRequestImplCopyWith<$Res>
    implements $UserRequestCopyWith<$Res> {
  factory _$$UserRequestImplCopyWith(
          _$UserRequestImpl value, $Res Function(_$UserRequestImpl) then) =
      __$$UserRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? datumKreiranja});
}

/// @nodoc
class __$$UserRequestImplCopyWithImpl<$Res>
    extends _$UserRequestCopyWithImpl<$Res, _$UserRequestImpl>
    implements _$$UserRequestImplCopyWith<$Res> {
  __$$UserRequestImplCopyWithImpl(
      _$UserRequestImpl _value, $Res Function(_$UserRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? datumKreiranja = freezed,
  }) {
    return _then(_$UserRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      datumKreiranja: freezed == datumKreiranja
          ? _value.datumKreiranja
          : datumKreiranja // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRequestImpl implements _UserRequest {
  _$UserRequestImpl({required this.id, this.datumKreiranja});

  factory _$UserRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRequestImplFromJson(json);

  @override
  final String id;
  @override
  final String? datumKreiranja;

  @override
  String toString() {
    return 'UserRequest(id: $id, datumKreiranja: $datumKreiranja)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.datumKreiranja, datumKreiranja) ||
                other.datumKreiranja == datumKreiranja));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, datumKreiranja);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRequestImplCopyWith<_$UserRequestImpl> get copyWith =>
      __$$UserRequestImplCopyWithImpl<_$UserRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRequestImplToJson(
      this,
    );
  }
}

abstract class _UserRequest implements UserRequest {
  factory _UserRequest(
      {required final String id,
      final String? datumKreiranja}) = _$UserRequestImpl;

  factory _UserRequest.fromJson(Map<String, dynamic> json) =
      _$UserRequestImpl.fromJson;

  @override
  String get id;
  @override
  String? get datumKreiranja;
  @override
  @JsonKey(ignore: true)
  _$$UserRequestImplCopyWith<_$UserRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
