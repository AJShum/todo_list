import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/logic/main_bloc.dart';
import 'package:todo_list/model/task.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/view/custom_color_scheme.dart';

/// [SwipedWidget] list component
class SwipedWidget extends StatelessWidget {
  // ignore: public_member_api_docs
  SwipedWidget(this.task, {super.key});

  Task task;

  final ValueNotifier<double> _leftIconPadding = ValueNotifier<double>(0);

  final ValueNotifier<double> _rightIconPadding = ValueNotifier<double>(0);

  @override
  Widget build(BuildContext context) {
    final customColor = Theme.of(context).extension<CustomColorScheme>()!;
    return LayoutBuilder(
      builder: (context, constrain) {
        return GestureDetector(
          onTap: () =>
              Navigator.of(context).pushNamed('/editPage', arguments: task),
          child: Dismissible(
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
                      child: Icon(Icons.check, color: customColor.white),
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
                      child: Icon(
                        Icons.delete,
                        color: customColor.white,
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
            onDismissed: (direction) {
              context.read<MainCubit>().deleteTask(task);
            },
            confirmDismiss: (DismissDirection direction) async {
              if (direction == DismissDirection.startToEnd) {
                log(
                  '[_SwipedWidgetState] swiped from left to right '
                  'on item ${task.id}',
                  name: 'info',
                );
                await context
                    .read<MainCubit>()
                    .changeTask(task.copyWith(done: true));
                return false;
              } else {
                log(
                  '[_SwipedWidgetState] swiped from right to left '
                  'on item ${task.id}',
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
                              'checkbox задачи ${task.id}',
                              name: 'info',
                            );
                            context
                                .read<MainCubit>()
                                .changeTask(task.copyWith(done: value));
                            // _repository.editTask(task.copyWith(done: value));
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  _getImportance(task.importance),
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
                          DateFormat.yMd().format(task.deadline),
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
                        'task ${task.id}',
                        name: 'info',
                      );
                      Navigator.of(context)
                          .pushNamed('/editPage', arguments: task);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _getImportance(TaskImportance importance) {
    return switch (task.importance) {
      (TaskImportance.low) => const Icon(
          Icons.low_priority,
          size: 24,
        ),
      (TaskImportance.high) => const Icon(
          Icons.priority_high,
          size: 24,
        ),
      _ => const SizedBox()
    };
  }
}
