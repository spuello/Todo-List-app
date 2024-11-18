import 'package:flutter/material.dart';
import 'package:todo/theme/theme.dart';

import 'app_router.dart';
import 'injection_container.dart' as di;

void main() {
  di.init();
  runApp(App());
}

class App extends StatelessWidget {
  static const _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do-List',
      onGenerateRoute: _appRouter.generateRoute,
      theme: appTheme(),
    );
  }
}
