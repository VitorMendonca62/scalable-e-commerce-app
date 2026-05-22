import 'package:flutter/material.dart';
import 'package:scalable_e_commerce_app/app/routes/app_router.dart';
import 'package:scalable_e_commerce_app/core/theme/colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Scalable E-Commerce App',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.accentForeground,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.accentForeground,
          selectionColor: AppColors.mutedForeground,
          selectionHandleColor: AppColors.primary,
        ),
        fontFamily: 'Montserrat',
      ),
      routerConfig: AppRouter.router,
    );
  }
}
