import 'package:flutter/material.dart';
import 'package:yati_airline/core/routes/routes_name.dart';
import 'package:yati_airline/feature/auth/presentation/screen/login_screen.dart';
import 'package:yati_airline/feature/home/presentation/screen/home_screen.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    // Object? argument = settings.arguments;

    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LoginScreen(),
        );
      case RoutesName.home:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HomeScreen(),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => const LoginScreen(),
        );
    }
  }
}
