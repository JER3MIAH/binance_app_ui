import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconAndText extends StatelessWidget {
  final String imagePath;
  final String text;
  const IconAndText({
    super.key,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 40,
          width: 40,
          child: Image.asset(imagePath),
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
