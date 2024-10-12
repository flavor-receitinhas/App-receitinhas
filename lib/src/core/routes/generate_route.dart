import 'package:app_receitas/src/core/global/register_module.dart';
import 'package:app_receitas/src/feactures/auth/auth_module.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/pages/choose_auth_page.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/pages/login_page.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/pages/register_page.dart';

import 'package:app_receitas/src/feactures/config/config_module.dart';
import 'package:app_receitas/src/feactures/favorite/presenter/favorite_module.dart';
import 'package:app_receitas/src/feactures/home/home_module.dart';
import 'package:app_receitas/src/feactures/onboarding/onboarding_module.dart';
import 'package:app_receitas/src/feactures/profile/perfil_module.dart';
import 'package:app_receitas/src/feactures/recipes/recipe_module.dart';
import 'package:app_receitas/src/feactures/search/search_module.dart';
import 'package:app_receitas/src/feactures/splash/splash_module.dart';
import 'package:flutter/material.dart';

class GenerateRoute {
  List<RegisterModule> routes = [
    SplashModule(),
    AuthModule(),
    OnboardingModule(),
    HomeModule(),
    RecipeModule(),
    FavoriteModule(),
    ConfigModule(),
    SearchModule(),
    ProfileModule(),
  ];

  void registerRoutes() {
    for (var modules in routes) {
      modules.inicialize();
    }
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    for (var module in routes) {
      if (module.routers.containsKey(settings.name)) {
        var widgetModule = module.routers[settings.name];
        if ([ChooseAuthPage.route, LoginPage.route, RegisterPage.route]
            .contains(settings.name)) {
          return routeWithAnimated(widgetModule!);
        }
        return MaterialPageRoute(
          builder: (context) => widgetModule!,
          settings: settings,
        );
      }
    }
    return MaterialPageRoute(
      builder: (context) => const Text('ERRO'),
      settings: settings,
    );
  }

  Route? routeWithAnimated(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
