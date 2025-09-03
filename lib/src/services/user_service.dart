import 'dart:convert';
import 'dart:io';

import 'package:derma_scan/src/data/models/request/user_request_model.dart';
import 'package:derma_scan/src/data/models/response/mole_prediction_response_model.dart';
import 'package:derma_scan/src/data/models/response/user_response_model.dart';
import 'package:derma_scan/src/services/base_service.dart';
import 'package:dio/dio.dart';

class UserService extends BaseService {
  Future<UserResponse> createKorisnik(UserRequest model) async {
    try {
      final response = await dio.post(
        "/endpoints/user/create",
        data: model,
      );
      return UserResponse.fromJson(response.data);
    } on DioError catch (dioErr) {
      throw dioErr.message ?? "Failed to create korisnik";
    } catch (e) {
      throw e.toString();
    }
  }
}
