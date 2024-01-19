import 'package:flutter/material.dart';

class CheckoutContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final void Function()? onTap;
  const CheckoutContainer({
    super.key,
    required this.child,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 17),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: color),
        child: child,
      ),
    );
  }
}
