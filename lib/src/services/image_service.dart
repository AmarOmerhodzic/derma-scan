import 'dart:convert';
import 'dart:io';

import 'package:derma_scan/src/data/models/request/album_request_model.dart';
import 'package:derma_scan/src/data/models/request/slika_request_model.dart';
import 'package:derma_scan/src/data/models/request/slika_update_request_model.dart';
import 'package:derma_scan/src/data/models/response/album_response_model.dart';
import 'package:derma_scan/src/data/models/response/mole_prediction_response_model.dart';
import 'package:derma_scan/src/data/models/response/slika_response_model.dart';
import 'package:derma_scan/src/services/base_service.dart';
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

  Future<AlbumResponse> createAlbum(AlbumRequest model) async {
    try {
      final response = await dio.post(
        "/endpoints/image/albums",
        data: model,
      );
      return AlbumResponse.fromJson(response.data);
    } on DioError catch (dioErr) {
      throw dioErr.message ?? "Failed to create album";
    } catch (e) {
      throw e.toString();
    }
  }

  // Get albums for a user
  Future<List<AlbumResponse>> getAlbumsByUser(String korisnikId) async {
    try {
      final response =
          await dio.get("/endpoints/image/users/$korisnikId/albums");
      return (response.data as List)
          .map((e) => AlbumResponse.fromJson(e))
          .toList();
    } on DioError catch (dioErr) {
      throw dioErr.message ?? "Failed to fetch albums";
    } catch (e) {
      throw e.toString();
    }
  }

  Future<SlikaResponse> createSlika(SlikaRequest model) async {
    try {
      final response = await dio.post(
        "/endpoints/image/slike",
        data: model.toJson(),
      );

      return SlikaResponse.fromJson(response.data);
    } on DioError catch (dioErr) {
      throw dioErr.message ?? "Failed to upload slika";
    } catch (e) {
      throw e.toString();
    }
  }

  // Update an existing Slika
  Future<SlikaResponse> updateSlika(
      String slikaId, SlikaUpdateRequest updateData) async {
    try {
      final response = await dio.put("/endpoints/image/slike/$slikaId",
          data: updateData.toJson());
      return SlikaResponse.fromJson(response.data);
    } on DioError catch (dioErr) {
      throw dioErr.message ?? "Failed to update slika";
    } catch (e) {
      throw e.toString();
    }
  }

  // Delete a Slika
  Future<void> deleteSlika(String slikaId) async {
    try {
      await dio.delete("/endpoints/image/slike/$slikaId");
    } on DioError catch (dioErr) {
      throw dioErr.message ?? "Failed to delete slika";
    } catch (e) {
      throw e.toString();
    }
  }

  // Get a single Slika by ID
  Future<SlikaResponse> getSlikaById(String slikaId) async {
    try {
      final response = await dio.get("/endpoints/image/slike/$slikaId");
      return SlikaResponse.fromJson(response.data);
    } on DioError catch (dioErr) {
      throw dioErr.message ?? "Failed to fetch slika";
    } catch (e) {
      throw e.toString();
    }
  }

  // Get all slike in an album
  Future<List<SlikaResponse>> getSlikeByAlbum(String albumId) async {
    try {
      final response = await dio.get("/endpoints/image/albums/$albumId/slike");
      return (response.data as List)
          .map((e) => SlikaResponse.fromJson(e))
          .toList();
    } on DioError catch (dioErr) {
      throw dioErr.message ?? "Failed to fetch slike";
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<SlikaResponse>> getLastThreeSlike(String korisnikId) async {
    try {
      final response =
          await dio.get("/endpoints/image/korisnik/$korisnikId/last3");
      return (response.data as List)
          .map((e) => SlikaResponse.fromJson(e))
          .toList();
    } on DioError catch (dioErr) {
      throw dioErr.message ?? "Failed to fetch last 3 slike";
    } catch (e) {
      throw e.toString();
    }
  }
}
