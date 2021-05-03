import 'package:acm_hacettepe/week4/core/enum/life_state_enum.dart';
import 'package:acm_hacettepe/week4/feature/task/viewmodel/task_view_model.dart';
import 'package:acm_hacettepe/week4/widget/task_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TaskView extends StatelessWidget {
  final TaskViewModel _viewModel = TaskViewModel();
  @override
  Widget build(BuildContext context) {
    if (_viewModel.context == null) {
      _viewModel.setContext(context);
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _viewModel.onIncrementCount();
          debugPrint('${_viewModel.count}');
        },
      ),
      appBar: AppBar(
        title: buildObserverAppBarTitle(),
      ),
      body: buildObserverBody(),
    );
  }

  Observer buildObserverAppBarTitle() {
    return Observer(
      builder: (_) => Visibility(
        child: CircularProgressIndicator(),
        visible: _viewModel.lifeCycle == LifeStateEnum.LOADING,
      ),
    );
  }

  Observer buildObserverBody() {
    return Observer(
      builder: (_) => ListView.builder(
        itemCount: _viewModel.items.length,
        itemBuilder: (BuildContext context, int index) =>
            TaskCard(taskModel: _viewModel.items[index]),
      ),
    );
  }
}
