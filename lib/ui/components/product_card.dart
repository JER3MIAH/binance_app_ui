import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String imageUrl;
  final double productPrice;
  const ProductCard({
    super.key,
    required this.productName,
    required this.imageUrl,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: theme.primary,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .18,
              width: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    productName,
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$$productPrice',
                        style:
                            GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                      ),
                      Image.asset(
                        'assets/icons/chilli-pepper.png',
                        height: 30,
                        width: 30,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 170,
            child: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 65,
            ),
          ),
        ],
      ),
    );
  }
}
