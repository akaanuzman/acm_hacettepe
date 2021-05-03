
import 'dart:io';

import 'package:acm_hacettepe/week4/feature/task/model/task_model.dart';
import 'package:acm_hacettepe/week4/feature/task/service/ITaskService.dart';
import 'package:dio/dio.dart';

part 'task_service_endpoints.dart';

class TaskService extends ITaskService {
  TaskService(Dio dio) : super(dio);

  @override
  Future<List<TaskModel>> fetchAllTask() async {
    final response = await dio.get(_TaskServiceEndPoints.DOGS.rawValue);
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;

      if (data is List) {
        return data.map((e) => TaskModel.fromJson(e)).toList();
      }
    }
    return [];
  }
}
