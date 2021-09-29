import 'package:onof_test_task/domain/data_providers/token_data_provider.dart';

class MyAppModel {
  final _tokenApiProvider = TokenDataProvider();

  var _isAuth = false;
  bool get isAuth => _isAuth;

  Future<void> checkAuth() async {
    final sessionId = await _tokenApiProvider.getToken();

    _isAuth = sessionId != null;
  }
}
