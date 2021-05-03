import 'package:acm_hacettepe/week4/core/enum/life_state_enum.dart';
import 'package:acm_hacettepe/week4/core/network/network_manager.dart';
import 'package:acm_hacettepe/week4/feature/task/model/task_model.dart';
import 'package:acm_hacettepe/week4/feature/task/service/ITaskService.dart';
import 'package:acm_hacettepe/week4/feature/task/service/task_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'task_view_model.g.dart';

class TaskViewModel = _TaskViewModelBase with _$TaskViewModel;

abstract class _TaskViewModelBase with Store {
  BuildContext? context;
  late ITaskService taskService;

  @computed
  bool get isOdd => count.isOdd;

  @observable
  List<TaskModel> items = [];

  @observable
  int count = 0;

  @observable
  LifeStateEnum lifeCycle = LifeStateEnum.IDDLE;

  _TaskViewModelBase({this.context}) {
    taskService = TaskService(NetworkManager.instance.dio);
  }

  void setContext(BuildContext context) {
    this.context = context;
    fetchItems();
  }

  @action
  Future<void> fetchItems() async {
    lifeCycle = LifeStateEnum.LOADING;
    items = await taskService.fetchAllTask();
    lifeCycle = LifeStateEnum.DONE;
  }

  @action
  void onIncrementCount() {
    count++;
  }
}
