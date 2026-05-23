import 'package:flutter/material.dart';
import 'package:scalable_e_commerce_app/app/routes/app_router.dart';
import 'package:scalable_e_commerce_app/core/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Scalable E-Commerce App',
      theme: AppTheme.ligth,
      routerConfig: AppRouter.router,
    );
  }
}
