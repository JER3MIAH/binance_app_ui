import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_delivery_app/ui/components/components.dart';
import 'package:food_delivery_app/ui/components/icon_and_text.dart';
import 'package:food_delivery_app/ui/pages/pages.dart';
import 'package:food_delivery_app/utils/page_transition.dart';
import 'package:food_delivery_app/utils/round_to_two.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductViewPage extends HookWidget {
  final String productName;
  final String description;
  final double productPrice;
  final String imageUrl;
  final int timeToPrepare;
  final int calories;
  final double ratings;
  const ProductViewPage({
    super.key,
    required this.productName,
    required this.description,
    required this.imageUrl,
    required this.timeToPrepare,
    required this.calories,
    required this.ratings,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final numOfItems = useState<int>(1);
    final query = MediaQuery.of(context).size;

    final totalPrice = numOfItems.value == 0
        ? productPrice
        : roundToTwoDecimalPlaces(productPrice * numOfItems.value);

    return Scaffold(
      backgroundColor: theme.background,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DarkBackButton(),
                      FavouriteButton(),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: query.height * .60,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: theme.primary,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: query.height * .18),
                    Padding(
                      padding: const EdgeInsets.only(top: 13, bottom: 8),
                      child: Text(
                        productName,
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndText(
                            imagePath: 'assets/icons/clock.png',
                            text: '$timeToPrepare min'),
                        IconAndText(
                            imagePath: 'assets/icons/fire.png',
                            text: '$calories calories'),
                        IconAndText(
                            imagePath: 'assets/icons/ratings.png',
                            text: '${ratings.toDouble()}'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      description,
                      style: GoogleFonts.montserrat(
                          color: Colors.grey, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyContainer(
                            color: Colors.grey.shade400,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if (numOfItems.value > 1) {
                                      numOfItems.value -= 1;
                                    }
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  child: Text(
                                    '${numOfItems.value}',
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    numOfItems.value += 1;
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ],
                            )),
                        CheckoutContainer(
                            color: Colors.grey.shade900,
                            onTap: () {
                              rightToLeftNavigation(
                                context,
                                CheckoutPage(
                                  numOfProducts: numOfItems.value,
                                  productName: productName,
                                  productPrice: productPrice,
                                  totalPrice: totalPrice,
                                ),
                              );
                            },
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Text(
                                    'Checkout ',
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '\$$totalPrice',
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: query.height * .20,
              child: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                radius: 130,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
