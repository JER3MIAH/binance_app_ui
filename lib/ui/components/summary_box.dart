import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryBox extends StatelessWidget {
  final double price;
  final TextStyle regularStyle;
  final TextStyle headerStyle;
  final void Function()? onPressed;
  const SummaryBox({
    super.key,
    required this.price,
    required this.regularStyle,
    required this.headerStyle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final boldStyle = GoogleFonts.lato(
      fontWeight: FontWeight.w700,
      fontSize: 20,
    );
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text('Summary', style: headerStyle),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Products', style: regularStyle),
              Text('\$$price', style: regularStyle),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery', style: regularStyle),
              Text('FREE', style: regularStyle),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Services', style: regularStyle),
              Text('\$1.00', style: regularStyle),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: boldStyle),
              Text(
                '\$${price + 1}',
                style: boldStyle,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                elevation: 3,
                minimumSize: const Size(300, 40),
              ),
              child: Text(
                'Confirm order',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
