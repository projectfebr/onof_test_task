import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _Keys {
  static const token = 'token';
  static const portal = 'portal';
}

// провайдер содержит методы (get, set) работы с защищенным хранилищем телефона. Хранит token и portal
class SessionDataProvider {
  static const _storage = FlutterSecureStorage();

  Future<String?> getToken() => _storage.read(key: _Keys.token);
  Future<void> setToken(String? value) async {
    if (value != null) {
      _storage.write(key: _Keys.token, value: value);
    } else {
      _storage.delete(key: _Keys.token);
    }
  }

// портал нам нужен для формирования url запроса
  Future<String?> getPortal() => _storage.read(key: _Keys.portal);
  Future<void> setPortal(String? value) async {
    if (value != null) {
      _storage.write(key: _Keys.portal, value: value);
    } else {
      _storage.delete(key: _Keys.portal);
    }
  }
}
