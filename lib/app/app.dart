import 'package:flutter/material.dart';
import 'package:scalable_e_commerce_app/app/routes/app_router.dart';
import 'package:scalable_e_commerce_app/core/global/app_keys.dart';
import 'package:scalable_e_commerce_app/core/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: scaffoldMessengerKey,
      title: 'Scalable E-Commerce App',
      locale: const Locale('pt', 'BR'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      theme: AppTheme.ligth,
      routerConfig: AppRouter.router,
    );
  }
}
