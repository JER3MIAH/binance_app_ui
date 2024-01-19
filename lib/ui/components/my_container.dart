import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  const MyContainer({
    super.key,
    required this.child,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(12), color: color),
      child: child,
    );
  }
}
