import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/logic/main_bloc.dart';
import 'package:todo_list/model/task.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// [EditPage] page for editing the addition of a specific task
class EditPage extends StatefulWidget {
  // ignore: public_member_api_docs
  const EditPage(this.editedTask, {super.key});

  final Task editedTask;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final TextEditingController _taskController = TextEditingController();

  bool _switchValue = false;

  late String _priority;

  @override
  void initState() {
    super.initState();
    if (widget.editedTask.text.isNotEmpty) {
      _taskController.text = widget.editedTask.text;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    switch (widget.editedTask.importance) {
      case (TaskImportance.absent):
        _priority = AppLocalizations.of(context)!.noPriority;
        break;

      case (TaskImportance.low):
        _priority = AppLocalizations.of(context)!.lowPriority;
        break;
      default:
        _priority = AppLocalizations.of(context)!.highPriority;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<MainCubit>().addTask(
                              widget.editedTask.copyWith(
                                text: _taskController.value.text,
                                importance: _convertPriority(context),
                              ),
                            );
                        Navigator.of(context).pop();
                      },
                      child: Text(AppLocalizations.of(context)!.save),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 204,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                          hintText: AppLocalizations.of(context)!.todo,
                        ),
                        controller: _taskController,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: PopupMenuButton<String>(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.importance,
                          textAlign: TextAlign.left,
                        ),
                        // FIX: make correct display
                        Text(_priority),
                      ],
                    ),
                    itemBuilder: (ctx) => [
                      AppLocalizations.of(context)!.noPriority,
                      AppLocalizations.of(context)!.lowPriority,
                      AppLocalizations.of(context)!.highPriority
                    ].map((e) {
                      return PopupMenuItem<String>(
                        value: e,
                        child: Text(
                          e,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: e ==
                                            AppLocalizations.of(context)!
                                                .highPriority
                                        ? Colors.red
                                        : Colors.white,
                                  ),
                        ),
                      );
                    }).toList(),
                    onSelected: (value) {
                      log(
                        '[EditPage] change priority to $value for '
                        '${widget.editedTask.id}',
                        name: 'info',
                      );
                      _priority = value;
                      context.read<MainCubit>().changeTask(
                            widget.editedTask.copyWith(
                                importance: _convertPriority(context)),
                          );
                      setState(() {});
                    },
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppLocalizations.of(context)!.finish),
                        Text(
                          DateFormat.yMd().format(widget.editedTask.deadline),
                        ),
                      ],
                    ),
                    Switch(
                      value: _switchValue,
                      onChanged: (value) {
                        _switchValue = value;
                        setState(() {});
                      },
                      // TODO: open calendar as modal widget and pick date
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Divider(),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    log(
                      '[EditPage] remove task with ${widget.editedTask.id}',
                      name: 'info',
                    );
                    context.read<MainCubit>().deleteTask(widget.editedTask);
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.delete),
                      ),
                      Text(AppLocalizations.of(context)!.remove)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  TaskImportance _convertPriority(BuildContext context) {
    if (_priority == AppLocalizations.of(context)!.noPriority) {
      return TaskImportance.absent;
    } else if (_priority == AppLocalizations.of(context)!.lowPriority) {
      return TaskImportance.low;
    } else {
      return TaskImportance.high;
    }
  }
}
