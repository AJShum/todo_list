import 'dart:developer';

import 'package:flutter/material.dart';

/// [SwipedWidget]
class SwipedWidget extends StatefulWidget {
  /// [SwipedWidget] constructor
  const SwipedWidget({super.key});

  @override
  State<SwipedWidget> createState() => _SwipedWidgetState();
}

class _SwipedWidgetState extends State<SwipedWidget> {
  late bool _checkboxState;

  final ValueNotifier<double> _leftIconPadding = ValueNotifier<double>(0);
  final ValueNotifier<double> _rightIconPadding = ValueNotifier<double>(0);

  @override
  void initState() {
    _checkboxState = false;
    super.initState();
  }

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
            log(direction.toString());
          },
          confirmDismiss: (DismissDirection direction) async {
            if (direction == DismissDirection.startToEnd) {
              return false;
            } else {
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
                      value: _checkboxState,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _checkboxState = value;
                          });
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
                        'current text',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text('дата', style: Theme.of(context).textTheme.bodySmall)
                    ],
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                const Icon(
                  Icons.info_outline,
                  size: 19.9,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
