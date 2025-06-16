import 'dart:io';

import 'package:derma_scan/src/data/models/response/mole_prediction_response_model.dart';
import 'package:derma_scan/src/services/base_service';
import 'package:dio/dio.dart';

class ImageService extends BaseService {
  Future<MolePredictionResponse> sendImageForAnalyze(File imageFile) async {
    try {
      final formData = FormData.fromMap({
        'image':
            await MultipartFile.fromFile(imageFile.path, filename: "mole.jpg"),
      });

      final response = await dio.post(
        "/endpoints/mole/analyze", // Adjust if your route is different
        data: formData,
        options: Options(
          headers: {
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      return MolePredictionResponse.fromJson(response.data);
    } on DioError catch (dioErr) {
      throw dioErr.message;
    } catch (e) {
      throw e.toString();
    }
  }
}
