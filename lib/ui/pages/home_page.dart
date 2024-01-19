import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_delivery_app/ui/pages/pages.dart';
import 'package:food_delivery_app/ui/views/home_body.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final selectedIndex = useState<int>(0);

    List<Widget> pages = [
      const HomeBody(),
      const SearchPage(),
      const FavouritesPage(),
      const Placeholder(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: selectedIndex.value,
        children: pages,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: theme.background,
          selectedItemColor: theme.primary,
          unselectedItemColor: theme.tertiary,
          currentIndex: selectedIndex.value,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (value) {
            selectedIndex.value = value;
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.view_week), label: ''),
          ],
        ),
      ),
    );
  }
}
