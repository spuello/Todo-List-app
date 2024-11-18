import 'package:flutter/material.dart';
import 'package:todo/features/todo/todo_list_screen.dart';

import 'app_router.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  static const _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do-List',
      onGenerateRoute: _appRouter.generateRoute,
    );
  }
}
