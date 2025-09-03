import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response_model.freezed.dart';
part 'user_response_model.g.dart';

@freezed
class UserResponse with _$UserResponse {
  factory UserResponse({
    required String id,
    required String datumKreiranja,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
