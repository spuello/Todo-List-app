import 'package:flutter/material.dart';

import 'features/signin/sign_screen.dart';
import 'features/todo/todo_list_screen.dart';

class AppRouter {
  const AppRouter();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
      case SignInScreen.routeName:
        return _buildPage(
          const SignInScreen(),
          settings: settings,
        );
      case TodoListScreen.routeName:
        return _buildPage(
          const TodoListScreen(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  static PageRouteBuilder _buildPage(Widget page, {RouteSettings? settings}) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => page,
      reverseTransitionDuration: const Duration(),
      transitionDuration: const Duration(),
    );
  }
}
