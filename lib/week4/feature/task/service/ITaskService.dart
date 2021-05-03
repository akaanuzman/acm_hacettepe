import 'package:acm_hacettepe/week4/feature/task/model/task_model.dart';
import 'package:dio/dio.dart';

abstract class ITaskService {
  final Dio dio;

  ITaskService(this.dio);

  Future<List<TaskModel>> fetchAllTask();
}
