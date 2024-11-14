import 'dart:ui';

import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/inject/inject.dart';
import 'package:app_receitas/src/core/routes/generate_route.dart';
import 'package:app_receitas/src/core/services/language/language_controller.dart';
import 'package:app_receitas/src/core/themes/custom_theme.dart';
import 'package:app_receitas/src/core/themes/theme.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GenerateRoute().registerRoutes();
  Inject.inicialize();
  await Firebase.initializeApp();
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeService _themeController = di();
  final LanguageController _languageController = di();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_themeController, _languageController]),
      builder: (context, _) {
        return MaterialApp(
          title: 'App Receitas',
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: _themeController.chooseTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: _languageController.currentLocale,
          initialRoute: '/splash',
          onGenerateRoute: GenerateRoute().generateRoute,
        );
      },
    );
  }
}
