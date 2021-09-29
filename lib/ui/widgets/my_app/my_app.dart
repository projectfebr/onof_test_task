import 'package:flutter/material.dart';
import 'package:onof_test_task/ui/navigation/main_navigation.dart';
import 'package:onof_test_task/ui/widgets/my_app/my_app_model.dart';

class MyApp extends StatelessWidget {
  //static чтобы не пересоздавался, он все равно всегда будет без изменений
  static final mainNavigation = MainNavigation();
  final MyAppModel model;
  const MyApp({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OnlyOffice test task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: mainNavigation.initialRoute(model.isAuth),
      routes: mainNavigation.routes,
    );
  }
}
