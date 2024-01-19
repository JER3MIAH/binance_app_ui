import 'package:flutter/material.dart';

class DarkBackButton extends StatelessWidget {
  final double? size;
  final Color? backgroundColor;
  const DarkBackButton({
    super.key,
    this.size,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: size,
        ),
      ),
    );
  }
}

class LightBackButton extends StatelessWidget {
  final double? size;
  final Color? backgroundColor;
  const LightBackButton({
    super.key,
    this.size,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade400.withOpacity(0.6),
        ),
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: size,
        ),
      ),
    );
  }
}
