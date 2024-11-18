import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/signin/presentation/bloc/sign_in_bloc.dart';

import 'features/signin/presentation/sign_screen.dart';
import 'features/signin/usecase/sign_in.dart';
import 'features/todo/todo_list_screen.dart';
import 'injection_container.dart';

class AppRouter {
  const AppRouter();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
      case SignInScreen.routeName:
        return _buildPage(
          BlocProvider(
            create: (context) => SignInBloc(signInUsecase: sl<SignIn>()),
            child: SignInScreen(),
          ),
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
