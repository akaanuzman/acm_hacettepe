


import 'dart:io';

import 'package:acm_hacettepe/week5/future/photos/model/photos_model.dart';
import 'package:acm_hacettepe/week5/future/photos/service/IPhotosService.dart';
import 'package:dio/dio.dart';

part 'photos_service_path.dart';

class PhotoService extends IPhotoService {
  PhotoService(Dio dio) : super(dio);

  @override
  Future<List<PhotoModel>> fetchAllPhotos() async {
    final response = await dio.get(_PhotoServicePath.PHOTOS.rawValue);

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      if (data is List) {
        return data.map((e) => PhotoModel.fromJson(e)).toList();
      }
    }
    return [];
  }
}
