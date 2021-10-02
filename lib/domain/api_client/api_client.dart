import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  Future<String> auth({
    required String username,
    required String password,
    required String portal,
  }) async {
    var url =
        Uri.parse('https://$portal.onlyoffice.eu/api/2.0/authentication.json');
    var response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'userName': username,
        'password': password,
      }),
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${jsonDecode(response.body)}');
    return jsonDecode(response.body)['response']['token'];
  }
}
