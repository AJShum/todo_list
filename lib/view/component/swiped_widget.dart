import 'package:flutter/material.dart';

const double swipeSize = 100;

/// [SwipedWidget]
class SwipedWidget extends StatefulWidget {
  /// [SwipedWidget] constructor
  const SwipedWidget({super.key});

  @override
  State<SwipedWidget> createState() => _SwipedWidgetState();
}

class _SwipedWidgetState extends State<SwipedWidget> {
  int _triggerState = 0;
  double _position = 0;
  bool _lock = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrain) {
        return GestureDetector(
          onPanUpdate: (details) {
            if (!_lock) {
              _lock = true;
              // Swiping in right direction.
              if (details.delta.dx > 0) {
                _triggerState += 1;
                _triggerState = _triggerState > 1 ? 1 : _triggerState;
              }
              if (details.delta.dx < 0) {
                _triggerState -= 1;
                _triggerState = _triggerState < 1 ? -1 : _triggerState;
              }
              switch (_triggerState) {
                case 0:
                  _position = 0;
                case 1:
                  _position = swipeSize;
                case -1:
                  _position = -swipeSize;
              }
              // ignore: inference_failure_on_instance_creation
              Future.delayed(const Duration(milliseconds: 150))
                  .then((value) => _lock = false);
              setState(() {});
            }
          },
          child: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                ],
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeInOut,
                width: constrain.maxWidth,
                left: _position,
                child: Container(
                  width: constrain.maxWidth,
                  height: 100,
                  color: Colors.green,
                  child: Column(
                    children: [
                      Text('hello world'),
                      Text('dino'),
                      Text('dino'),
                      Text('dino'),
                      Text('dino')
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
