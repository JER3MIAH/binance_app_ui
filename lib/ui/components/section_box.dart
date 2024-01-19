import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionBox extends StatelessWidget {
  final Widget child;
  final String title;
  final bool isSelected;
  const SectionBox({
    super.key,
    required this.child,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color:
                isSelected ? const Color(0xff191919) : const Color(0xffFFFFFF),
          ),
          child: SizedBox(
            height: 33,
            width: 33,
            child: child,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.black : Colors.grey,
          ),
        )
      ],
    );
  }
}
