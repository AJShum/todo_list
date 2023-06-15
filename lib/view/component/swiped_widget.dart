import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/model/task.dart';

/// [SwipedWidget] list component
class SwipedWidget extends StatelessWidget {
  // ignore: public_member_api_docs
  SwipedWidget(this.task, {super.key});

  Task task;

  final ValueNotifier<double> _leftIconPadding = ValueNotifier<double>(0);

  final ValueNotifier<double> _rightIconPadding = ValueNotifier<double>(0);

  final FakeTaskRepository _repository = Get.find<FakeTaskRepository>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrain) {
        return Dismissible(
          onUpdate: (DismissUpdateDetails details) {
            if (details.direction == DismissDirection.startToEnd) {
              _leftIconPadding.value =
                  details.progress * constrain.maxWidth - 40;
            } else {
              _rightIconPadding.value =
                  details.progress * constrain.maxWidth - 40;
            }
          },
          background: Container(
            width: double.maxFinite,
            alignment: Alignment.centerLeft,
            color: Colors.green,
            child: ValueListenableBuilder(
              valueListenable: _leftIconPadding,
              builder: (BuildContext context, double value, Widget? child) {
                if (value > 0) {
                  return Padding(
                    padding: EdgeInsets.only(left: value),
                    child: const Icon(Icons.check),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
          secondaryBackground: Container(
            width: double.maxFinite,
            alignment: Alignment.centerRight,
            color: Colors.red,
            child: ValueListenableBuilder(
              valueListenable: _rightIconPadding,
              builder: (BuildContext context, double value, Widget? child) {
                if (value > 0) {
                  return Padding(
                    padding: EdgeInsets.only(right: value),
                    child: const Icon(Icons.delete),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
          onDismissed: (direction) {
            // TODO: only delete
          },
          confirmDismiss: (DismissDirection direction) async {
            if (direction == DismissDirection.startToEnd) {
              log(
                '[_SwipedWidgetState] swiped from left to right '
                'on item ${task.id.v4}',
                name: 'info',
              );
              // TODO: done
              return false;
            } else {
              log(
                '[_SwipedWidgetState] swiped from right to left '
                'on item ${task.id.v4}',
                name: 'info',
              );
              return true;
            }
          },
          key: UniqueKey(),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: ConstrainedBox(
                    constraints:
                        const BoxConstraints(maxWidth: 18, maxHeight: 18),
                    child: Checkbox(
                      value: task.done,
                      onChanged: (value) {
                        if (value != null) {
                          log(
                            '[_SwipedWidgetState] пользователь нажал на'
                            'checkbox задачи ${task.id.v4}',
                            name: 'info',
                          );
                          _repository.editTask(task.copyWith(done: value));
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.text,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        // FIX: change later
                        task.deadline.toString(),
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.info_outline,
                    size: 19.9,
                  ),
                  onPressed: () {
                    log(
                      '[SwipedWdget] user push information icon on'
                      'task ${task.id.v4}',
                      name: 'info',
                    );
                    Navigator.of(context)
                        .pushNamed('/editPage', arguments: task);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
