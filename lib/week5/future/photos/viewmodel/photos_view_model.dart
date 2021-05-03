import 'package:acm_hacettepe/week5/core/constants/network/application_constants.dart';
import 'package:acm_hacettepe/week5/future/photos/model/photos_model.dart';
import 'package:acm_hacettepe/week5/future/photos/service/IPhotosService.dart';
import 'package:acm_hacettepe/week5/future/photos/service/photo_service.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';
part 'photos_view_model.g.dart';

class PhotosViewModel = _PhotosViewModelBase with _$PhotosViewModel;

abstract class _PhotosViewModelBase with Store {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: ApplicationConstant.instance.baseUrl));
  late final IPhotoService photoService;

  @observable
  List<PhotoModel> photos = [];

  @observable
  bool isLoading = false;

  _PhotosViewModelBase() {
    photoService = PhotoService(_dio);
    fetchAllPhotos();
  }

  @action
  Future<void> fetchAllPhotos() async {
    changeLoading();
    final response = await photoService.fetchAllPhotos();
    //Logger().wtf(response); Çekilen tüm verileri print eder.
    photos = response;
        changeLoading();
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }
}
