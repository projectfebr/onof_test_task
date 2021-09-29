import 'package:flutter/material.dart';
import 'package:onof_test_task/ui/widgets/auth/auth_model.dart';
import 'package:onof_test_task/ui/widgets/auth/auth_widget.dart';
import 'package:onof_test_task/ui/widgets/main_screen/main_screen.dart';
import 'package:provider/provider.dart';

class MainNavigationRouteNames {
  static const auth = 'auth';
  static const mainScreen = '/';
}

class MainNavigation {
  String initialRoute(bool isAuth) => isAuth
      ? MainNavigationRouteNames.mainScreen
      : MainNavigationRouteNames.auth;

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.auth: (context) => ChangeNotifierProvider(
          create: (context) => AuthModel(),
          child: const AuthWidget(),
        ),
    MainNavigationRouteNames.mainScreen: (context) => const MainScreenWidget()
  };
}
