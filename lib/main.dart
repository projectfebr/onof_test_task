import 'package:flutter/material.dart';
import 'package:onof_test_task/ui/navigation/main_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //static чтобы не пересоздавался, он все равно всегда будет без изменений
  static final mainNavigation = MainNavigation();
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OnlyOffice test task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: mainNavigation.initialRoute(true),
      routes: mainNavigation.routes,
    );
  }
}
