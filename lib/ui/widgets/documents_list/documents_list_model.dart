import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onof_test_task/domain/api_client/api_addresses.dart';
import 'package:onof_test_task/domain/api_client/api_client.dart';
import 'package:onof_test_task/domain/data_providers/session_data_provider.dart';
import 'package:onof_test_task/domain/entity/documents_list_response.dart';
import 'package:onof_test_task/ui/navigation/main_navigation.dart';

class DocumentsListModel extends ChangeNotifier {
  // context нужен для обработки ошибки авторизации -
  //переход на экран логина (на случай если токен станет не валидный)
  BuildContext context;

  // при инициализации загружаем документы
  DocumentsListModel(
    String api,
    this.context,
  ) {
    loadDocuments(api);
  }

  final _apiClient = ApiClient();

  final _folders = <FolderOnlyOffice>[];
  List<FolderOnlyOffice> get folders => List.unmodifiable(_folders);

  final _files = <DocumentOnlyOffice>[];
  List<DocumentOnlyOffice> get files => List.unmodifiable(_files);

  final DateFormat _dateFormat = DateFormat.yMMMMd();

// parentId - для перехода назад
  int? parentId;
  // currentId - для обновления текущей папки (жест pull down)
  int? currentId;

  String? token;
  String? portal;

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  Future<void> loadDocuments(String api) async {
    // api - эндпоинт запроса
    // проверяем токен и портал, если null - то получаем
    token ??= await SessionDataProvider().getToken();
    portal ??= await SessionDataProvider().getPortal();

// если токен и портал null - переходим на экран авторизации;
    if (token == null) {
      await SessionDataProvider().setPortal(null);
      Navigator.pushReplacementNamed((context), MainNavigationRouteNames.auth);
    }
    if (portal == null) {
      await SessionDataProvider().setToken(null);
      Navigator.pushReplacementNamed((context), MainNavigationRouteNames.auth);
    }

// отправляем запрос, добалвяем папки и файлы,
//устанавливаемы текущую и родительскую папки
    DocumentsList documentsListResponse;
    try {
      documentsListResponse = await _apiClient.getDocumentsList(
          token: token!, portal: portal!, api: api);
      _folders.addAll(documentsListResponse.response.folders);
      _files.addAll(documentsListResponse.response.files);
      parentId = documentsListResponse.response.current.parentId;
      currentId = documentsListResponse.response.current.id;
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.auth) {
        Navigator.pushReplacementNamed(
            (context), MainNavigationRouteNames.auth);
      }
    }
  }

  Future<void> getList(String api) async {
    _folders.clear();
    _files.clear();
    notifyListeners();
    await loadDocuments(api);
  }

  Future<void> updateList() async {
    await getList('${ApiEndpoint.filesByFolderId}/$currentId');
  }
}
