import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onof_test_task/domain/api_client/api_client.dart';
import 'package:onof_test_task/domain/data_providers/session_data_provider.dart';
import 'package:onof_test_task/ui/navigation/main_navigation.dart';

class AuthModel extends ChangeNotifier {
  final _apiCLient = ApiClient();
  final _sessionDataProvider = SessionDataProvider();

  final loginTextController = TextEditingController();
  final passTextController = TextEditingController();
  final portalTextController = TextEditingController();

  String? _errorMessage;
  String? get errorMesage => _errorMessage;

  bool _isAuthProgress = false;
  bool get canStartAuth => !_isAuthProgress;
  bool get isAuthProgress => _isAuthProgress;

  Future<void> auth(BuildContext context) async {
    final username = loginTextController.text;
    final password = passTextController.text;
    final portal = portalTextController.text;

    // проверка введенных значений, заполнение ошибки
    if (username.isEmpty || password.isEmpty || portal.isEmpty) {
      _errorMessage = 'Fill in all the input fields';
      notifyListeners();
      return;
    }
    _errorMessage = null;
    _isAuthProgress = true;

    notifyListeners();
    String? token;
    try {
      token = await _apiCLient.auth(
          username: username, password: password, portal: portal);
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionType.network:
          _errorMessage = 'Server not available. Check internet connection.';
          break;
        case ApiClientExceptionType.auth:
          _errorMessage = 'Incorrect login or password.';
          break;
        case ApiClientExceptionType.portal:
          _errorMessage = 'Check the name of the portal.';
          break;
        case ApiClientExceptionType.other:
          _errorMessage = 'An error has occurred. Try again.';
          break;
      }
    }

    _isAuthProgress = false;
    if (_errorMessage != null) {
      notifyListeners();
      return;
    }

    if (token == null) {
      _errorMessage = 'An error has occurred. Try again.';
      return;
    }

    await _sessionDataProvider.setToken(token);
    await _sessionDataProvider.setPortal(portal);

    unawaited(Navigator.of(context)
        .pushReplacementNamed(MainNavigationRouteNames.mainScreen));
  }
}
