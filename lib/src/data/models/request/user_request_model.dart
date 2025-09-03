import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_request_model.freezed.dart';
part 'user_request_model.g.dart';

@freezed
class UserRequest with _$UserRequest {
  factory UserRequest({
    required String id,
    String? datumKreiranja, // ISO8601 format
  }) = _UserRequest;

  factory UserRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRequestFromJson(json);
}
