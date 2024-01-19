import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void kSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.black.withOpacity(0.5),
      content: Text(
        text,
        style: GoogleFonts.montserrat(
          color: Colors.white,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
