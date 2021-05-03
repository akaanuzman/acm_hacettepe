import 'package:acm_hacettepe/week5/future/photos/model/photos_model.dart';
import 'package:dio/dio.dart';

abstract class IPhotoService {
  final Dio dio;

  IPhotoService(this.dio);

  Future<List<PhotoModel>> fetchAllPhotos();
}
