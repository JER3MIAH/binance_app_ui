import 'package:flutter/material.dart';

class FillerContainer extends StatelessWidget {
  final double? size;
  final IconData icon;
  final void Function()? onTap;
  const FillerContainer({
    super.key,
    this.size,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          icon,
          color: Colors.black,
          size: size,
        ),
      ),
    );
  }
}

class LightFillerContainer extends StatelessWidget {
  final double? size;
  final Color? color;
  final IconData icon;
  final void Function()? onTap;
  const LightFillerContainer({
    super.key,
    this.size,
    this.color = Colors.black,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.withOpacity(0.4),
        ),
        child: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
