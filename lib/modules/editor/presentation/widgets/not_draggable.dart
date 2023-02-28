import 'package:flutter/material.dart';

class NotDraggable extends StatelessWidget {
  const NotDraggable({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {},
      child: child,
    );
  }
}
