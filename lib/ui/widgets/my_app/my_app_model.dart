import 'package:onof_test_task/domain/data_providers/session_data_provider.dart';

// Модель приложения. Проверяет статус авторизации при запуске.
class MyAppModel {
  final _tokenApiProvider = SessionDataProvider();

  var _isAuth = false;
  bool get isAuth => _isAuth;

  Future<void> checkAuth() async {
    final sessionId = await _tokenApiProvider.getToken();

    _isAuth = sessionId != null;
  }
}
