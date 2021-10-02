import 'package:flutter/material.dart';
import 'package:onof_test_task/ui/widgets/my_app/my_app.dart';
import 'package:onof_test_task/ui/widgets/my_app/my_app_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final model = MyAppModel();
  await model.checkAuth();
  runApp(MyApp(model: model));
}
