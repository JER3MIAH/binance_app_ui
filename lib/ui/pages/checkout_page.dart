// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:food_delivery_app/services/api_service.dart';
import 'package:food_delivery_app/ui/components/components.dart';
import 'package:food_delivery_app/ui/pages/pages.dart';
import 'package:food_delivery_app/utils/page_transition.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutPage extends StatelessWidget {
  final int numOfProducts;
  final String productName;
  final double productPrice;
  final double totalPrice;
  const CheckoutPage({
    super.key,
    required this.numOfProducts,
    required this.productName,
    required this.productPrice,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    final headerStyle = GoogleFonts.lato(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    );
    final regStyle = GoogleFonts.montserrat(fontSize: 17);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text(
          'Checkout',
          style: GoogleFonts.montserrat(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your order', style: headerStyle),
            Row(
              children: [
                Text(
                  '$numOfProducts products from ',
                  style: regStyle,
                ),
                Text(
                  'The Place',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Text(
                  '${numOfProducts}x',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700, fontSize: 17),
                ),
                const SizedBox(width: 10),
                Text(
                  productName,
                  style: regStyle,
                ),
                const Spacer(),
                Text(
                  '\$$totalPrice',
                  style: regStyle,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text('Delivery details', style: headerStyle),
            InkWell(
              onTap: () {
                smoothNavigation(context, const MapsPage());
              },
              child: Card(
                child: Container(
                  height: 100,
                  margin: const EdgeInsets.all(8),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Image.asset('assets/images/map-image.jpg'),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                smoothNavigation(context, const MapsPage());
              },
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  '70 Washington Square',
                  style: regStyle,
                ),
                subtitle: const Text(
                  'Tap to view delivery route',
                ),
                trailing: const Icon(Icons.arrow_drop_down),
                leading: const Icon(
                  Icons.flag,
                  color: Colors.green,
                ),
              ),
            ),
            SummaryBox(
              price: totalPrice,
              regularStyle: regStyle,
              headerStyle: headerStyle,
              onPressed: () async {
                try {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(child: CircularProgressIndicator.adaptive()),
                          ],
                        ),
                      );
                    },
                  );
                  await ApiService.checkout(
                      productName, totalPrice, numOfProducts);
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                  kSnackBar(context, 'Checkout successful');
                } catch (e) {
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                  kSnackBar(context, '$e');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
