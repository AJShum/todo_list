import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_list/model/task.dart';

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

// FIX: switchValue should be false only if there is no deadline
  bool _switchValue = false;

  String _priority = 'Нет';

  @override
  void initState() {
    super.initState();
    if (widget.editedTask.text.isNotEmpty) {
      _taskController.text = widget.editedTask.text;
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
                        // TODO: close without saving
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        // TODO: close with save data
                        Navigator.of(context).pop();
                      },
                      child: const Text('СОХРАНИТЬ'),
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
                        decoration: const InputDecoration.collapsed(
                          hintText: 'Что надо сделать..',
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
                        const Text(
                          'Важность',
                          textAlign: TextAlign.left,
                        ),
                        // FIX: make correct display
                        Text(_priority),
                      ],
                    ),
                    itemBuilder: (ctx) =>
                        ['Нет', 'Низкий', '!! Высокий'].map((e) {
                      return PopupMenuItem<String>(
                        value: e,
                        child: Text(
                          e,
                          // FIX: change when we go through topics
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: e == '!! Высокий'
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
                          name: 'info');
                      _priority = value;
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
                        const Text('Cделать до'),
                        // TODO: make a normal date display
                        Text('${widget.editedTask.deadline}'),
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
                    // TODO: remove item
                  },
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.delete),
                      ),
                      Text('Удалить')
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
}
