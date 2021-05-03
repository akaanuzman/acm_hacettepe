import 'package:dio/dio.dart';

import '../model/photos_model.dart';

abstract class IPhotoService {
  final Dio dio;

  IPhotoService(this.dio);

  Future<List<PhotoModel>> fetchAllPhotos();
}
