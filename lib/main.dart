import 'package:flutter/material.dart';
import 'package:onof_test_task/ui/widgets/auth/auth_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OnlyOffice test task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthWidget(),
    );
  }
}
