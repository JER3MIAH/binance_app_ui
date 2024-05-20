import 'package:binance_app_ui/src/features/theme/data/theme.dart';
import 'package:binance_app_ui/src/features/theme/logic/theme_provider.dart';
import 'package:binance_app_ui/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/home/presentation/screens/home_screen.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final themeProv = ref.watch(themeProvider);

    return Builder(builder: (context) {
      final media = MediaQueryData.fromView(View.of(context));
      Dims.setSize(media);
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: const TextScaler.linear(1),
        ),
        child: MaterialApp(
          title: 'Agency Mobile',
          theme: themeProv.isDarkMode ? darkTheme : lightTheme,
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
        ),
      );
    });
  }
}
