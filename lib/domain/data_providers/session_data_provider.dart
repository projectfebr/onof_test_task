import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _Keys {
  static const token = 'token';
  static const portal = 'portal';
}

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

  Future<String?> getPortal() => _storage.read(key: _Keys.portal);
  Future<void> setPortal(String? value) async {
    if (value != null) {
      _storage.write(key: _Keys.portal, value: value);
    } else {
      _storage.delete(key: _Keys.portal);
    }
  }
}
