import 'package:flutter/material.dart';
import 'package:onof_test_task/domain/api_client/api_client.dart';
import 'package:onof_test_task/domain/data_providers/session_data_provider.dart';

enum Section { myDocuments, commonDocuments }

class MainScreenModel extends ChangeNotifier {
  Section selectedTab = Section.myDocuments;
  final _apiClient = ApiClient();
  String? userName;
  String? userEmail;
  String? avatarPath;
  String? token;

  void setTab(Section section) {
    selectedTab = section;
    notifyListeners();
  }

  Future<void> setUserData() async {
    if (userEmail != null && userEmail != null && avatarPath != null) return;

    token = await SessionDataProvider().getToken();
    final portal = await SessionDataProvider().getPortal();
    if (token == null || portal == null) return;
    final userProfile =
        await _apiClient.getUserProfile(token: token!, portal: portal);
    userName =
        userProfile.response.firstName + ' ' + userProfile.response.lastName;
    userEmail = userProfile.response.email;

    avatarPath = _generateAvatarPath(userProfile.response.avatar, portal);

    notifyListeners();
  }

  String _generateAvatarPath(String sourcePath, String portal) {
    if (sourcePath.contains('onlyoffice')) return sourcePath;
    if (portal == 'personal') {
      return 'https://personal.onlyoffice.com$sourcePath';
    }
    return 'https://$portal.onlyoffice.eu$sourcePath';
  }
}
