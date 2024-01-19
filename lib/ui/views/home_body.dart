import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/section_model.dart';
import 'package:food_delivery_app/services/services.dart';
import 'package:food_delivery_app/ui/components/components.dart';
import 'package:food_delivery_app/ui/pages/product_view_page.dart';
import 'package:food_delivery_app/utils/page_transition.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final List<Section> _sections = [
    Section(
      title: 'Main',
      imagePath: 'assets/images/main-section.png',
    ),
    Section(
      title: 'Soups',
      imagePath: 'assets/images/soups-section.png',
    ),
    Section(
      title: 'Salads',
      imagePath: 'assets/images/salads-section.png',
    ),
    Section(
      title: 'Drinks',
      imagePath: 'assets/images/drinks-section.png',
    ),
  ];

  late Section _selectedSection;

  @override
  void initState() {
    _selectedSection = _sections[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ImageIcon(AssetImage('assets/icons/menu-icon.png')),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar-image.png'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Good food.\nFast delivery.',
                  style: GoogleFonts.arimo(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 135,
              child: ListView.builder(
                itemCount: _sections.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final section = _sections[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 10, left: 3),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedSection = section;
                        });
                      },
                      child: SectionBox(
                        title: section.title,
                        isSelected: _selectedSection == section,
                        child: Image.asset(section.imagePath),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Popular now',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            FutureBuilder(
              future: ApiService.getProductData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      children: [
                        Text(snapshot.error.toString()),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black.withOpacity(0.2)),
                            onPressed: () {
                              setState(() {
                                ApiService.getProductData();
                              });
                            },
                            child: const Text('Try again'))
                      ],
                    ),
                  );
                }

                final products = snapshot.data!;

                return SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          bottomToTopNavigation(
                            context,
                            ProductViewPage(
                              imageUrl: products[index]['image'],
                              productName: products[index]['productName'],
                              productPrice: products[index]['productPrice'],
                              description: products[index]['description'],
                              timeToPrepare: products[index]['timeToPrepare'],
                              calories: products[index]['calories'],
                              ratings: products[index]['rating'],
                            ),
                          );
                        },
                        child: ProductCard(
                            productName: products[index]['productName'],
                            imageUrl: products[index]['image'],
                            productPrice: products[index]['productPrice']),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
