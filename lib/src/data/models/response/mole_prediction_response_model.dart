import 'package:freezed_annotation/freezed_annotation.dart';

part 'mole_prediction_response_model.freezed.dart';
part 'mole_prediction_response_model.g.dart';

@freezed
class MolePredictionResponse with _$MolePredictionResponse {
  factory MolePredictionResponse({
      String? result,
      double? confidence
  }) = _MolePredictionResponse;

  factory MolePredictionResponse.fromJson(Map<String, dynamic> json) =>
      _$MolePredictionResponseFromJson(json);
}

