import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class WidgetSize extends StatefulWidget {
  final Widget child;
  final Function onChange;

  const WidgetSize({
    required this.onChange,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  _WidgetSizeState createState() => _WidgetSizeState();
}

class _WidgetSizeState extends State<WidgetSize> {
  final widgetKey = GlobalKey();
  Size? oldSize;

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance?.addPostFrameCallback(postFrameCallback);
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }

  void postFrameCallback(_) {
    final context = widgetKey.currentContext;
    if (context == null) return;

    final newSize = context.size;
    if (newSize == null || oldSize == newSize) return;

    oldSize = newSize;
    widget.onChange(newSize.height);
  }
}
