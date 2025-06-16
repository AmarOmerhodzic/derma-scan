// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mole_prediction_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MolePredictionResponseImpl _$$MolePredictionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MolePredictionResponseImpl(
      result: json['result'] as String?,
      confidence: (json['confidence'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$MolePredictionResponseImplToJson(
        _$MolePredictionResponseImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'confidence': instance.confidence,
    };
