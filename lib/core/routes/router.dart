import 'package:flutter/material.dart';
import 'package:moniepoint/core/routes/routes.dart';
import 'package:moniepoint/features/shared/presentation/parent_screen.dart';
import 'package:moniepoint/features/shared/presentation/splash_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoute.navParent:
        return MaterialPageRoute(builder: (_) => const ParentScreen());

      default:
        return errorScreen('404: Page not found');
    }
  }

  static MaterialPageRoute errorScreen(String msg) {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              body: Center(
                child: Text(msg),
              ),
            ));
  }
}
