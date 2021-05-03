import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/enum/life_state_enum.dart';
import '../../../widget/task_card.dart';
import '../viewmodel/task_view_model.dart';

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
