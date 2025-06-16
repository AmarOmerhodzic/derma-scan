// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mole_prediction_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MolePredictionResponse _$MolePredictionResponseFromJson(
    Map<String, dynamic> json) {
  return _MolePredictionResponse.fromJson(json);
}

/// @nodoc
mixin _$MolePredictionResponse {
  String? get result => throw _privateConstructorUsedError;
  double? get confidence => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MolePredictionResponseCopyWith<MolePredictionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MolePredictionResponseCopyWith<$Res> {
  factory $MolePredictionResponseCopyWith(MolePredictionResponse value,
          $Res Function(MolePredictionResponse) then) =
      _$MolePredictionResponseCopyWithImpl<$Res, MolePredictionResponse>;
  @useResult
  $Res call({String? result, double? confidence});
}

/// @nodoc
class _$MolePredictionResponseCopyWithImpl<$Res,
        $Val extends MolePredictionResponse>
    implements $MolePredictionResponseCopyWith<$Res> {
  _$MolePredictionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
    Object? confidence = freezed,
  }) {
    return _then(_value.copyWith(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String?,
      confidence: freezed == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MolePredictionResponseImplCopyWith<$Res>
    implements $MolePredictionResponseCopyWith<$Res> {
  factory _$$MolePredictionResponseImplCopyWith(
          _$MolePredictionResponseImpl value,
          $Res Function(_$MolePredictionResponseImpl) then) =
      __$$MolePredictionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? result, double? confidence});
}

/// @nodoc
class __$$MolePredictionResponseImplCopyWithImpl<$Res>
    extends _$MolePredictionResponseCopyWithImpl<$Res,
        _$MolePredictionResponseImpl>
    implements _$$MolePredictionResponseImplCopyWith<$Res> {
  __$$MolePredictionResponseImplCopyWithImpl(
      _$MolePredictionResponseImpl _value,
      $Res Function(_$MolePredictionResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
    Object? confidence = freezed,
  }) {
    return _then(_$MolePredictionResponseImpl(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String?,
      confidence: freezed == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MolePredictionResponseImpl implements _MolePredictionResponse {
  _$MolePredictionResponseImpl({this.result, this.confidence});

  factory _$MolePredictionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MolePredictionResponseImplFromJson(json);

  @override
  final String? result;
  @override
  final double? confidence;

  @override
  String toString() {
    return 'MolePredictionResponse(result: $result, confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MolePredictionResponseImpl &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, result, confidence);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MolePredictionResponseImplCopyWith<_$MolePredictionResponseImpl>
      get copyWith => __$$MolePredictionResponseImplCopyWithImpl<
          _$MolePredictionResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MolePredictionResponseImplToJson(
      this,
    );
  }
}

abstract class _MolePredictionResponse implements MolePredictionResponse {
  factory _MolePredictionResponse(
      {final String? result,
      final double? confidence}) = _$MolePredictionResponseImpl;

  factory _MolePredictionResponse.fromJson(Map<String, dynamic> json) =
      _$MolePredictionResponseImpl.fromJson;

  @override
  String? get result;
  @override
  double? get confidence;
  @override
  @JsonKey(ignore: true)
  _$$MolePredictionResponseImplCopyWith<_$MolePredictionResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
