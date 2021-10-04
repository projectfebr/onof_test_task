import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:onof_test_task/domain/api_client/api_addresses.dart';
import 'package:onof_test_task/domain/entity/documents_list_response.dart';
import 'package:onof_test_task/domain/entity/user_profile.dart';
import 'package:onof_test_task/ui/widgets/auth/auth_model.dart';

///statusCode: 404 (когда неправильно указан портал)
///statusCode: 500 ошибка

String makeHost(String portal) {
  if (portal == 'personal') {
    return 'https://$portal.onlyoffice.com';
  } else {
    return 'https://$portal.onlyoffice.eu';
  }
}

class ApiClient {
  Future<String> auth({
    required String username,
    required String password,
    required String portal,
  }) async {
    final host = makeHost(portal);
    var url = Uri.parse('$host/${ApiEndpoint.auth}');

    try {
      var response = await http
          .post(
            url,
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
            body: jsonEncode({
              'userName': username,
              'password': password,
            }),
          )
          .timeout(
            const Duration(seconds: 20),
            onTimeout: () => throw ApiClientAuthException(
                ApiClientAuthExceptionType.network),
          );
      if (response.statusCode == 404) {
        return throw ApiClientAuthException(ApiClientAuthExceptionType.portal);
      }
      final responseJson = jsonDecode(response.body);
      _validateResponse(response, responseJson);
      return jsonDecode(response.body)['response']['token'];
    } on SocketException {
      throw ApiClientAuthException(ApiClientAuthExceptionType.network);
    } on ApiClientAuthException {
      rethrow;
    } catch (e) {
      throw ApiClientAuthException(ApiClientAuthExceptionType.other);
    }
  }

  Future<UserProfile> getUserProfile({
    required String token,
    required String portal,
  }) async {
    final host = makeHost(portal);
    var url = Uri.parse('$host/${ApiEndpoint.profile}');
    try {
      var response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': token,
        },
      );
      final json = jsonDecode(response.body);
      final userProfile = UserProfile.fromJson(json);
      return userProfile;
    } on SocketException {
      throw ApiClientAuthException(ApiClientAuthExceptionType.network);
    } on ApiClientAuthException {
      rethrow;
    } catch (e) {
      throw ApiClientAuthException(ApiClientAuthExceptionType.other);
    }
  }

  Future<DocumentsList> getDocumentsList({
    required String token,
    required String portal,
    required String api,
  }) async {
    final host = makeHost(portal);
    var url = Uri.parse('$host/$api');
    try {
      var response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': token,
        },
      );
      final json = jsonDecode(response.body);
      final documentsListResponse = DocumentsList.fromJson(json);
      return documentsListResponse;
    } on SocketException {
      throw ApiClientAuthException(ApiClientAuthExceptionType.network);
    } on ApiClientAuthException {
      rethrow;
    } catch (e) {
      throw ApiClientAuthException(ApiClientAuthExceptionType.other);
    }
  }

  void _validateResponse(Response response, Map<String, dynamic> json) {
    if (response.statusCode == 500) {
      final int status = json["statusCode"] as int;
      final code = status is int ? status : 0;
      if (code == 500) {
        throw ApiClientAuthException(ApiClientAuthExceptionType.auth);
      } else {
        throw ApiClientAuthException(ApiClientAuthExceptionType.other);
      }
    }
  }
}
