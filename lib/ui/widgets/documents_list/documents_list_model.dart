import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onof_test_task/domain/api_client/api_addresses.dart';
import 'package:onof_test_task/domain/api_client/api_client.dart';
import 'package:onof_test_task/domain/data_providers/session_data_provider.dart';
import 'package:onof_test_task/domain/entity/documents_list_response.dart';
import 'package:onof_test_task/ui/navigation/main_navigation.dart';

class DocumentsListModel extends ChangeNotifier {
  BuildContext context;
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

  int? parentId;
  int? currentId;

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  Future<void> loadDocuments(String api) async {
    final token = await SessionDataProvider().getToken();
    final portal = await SessionDataProvider().getPortal();
    if (token == null || portal == null) return;
    DocumentsList documentsListResponse;
    try {
      documentsListResponse = await _apiClient.getDocumentsList(
          token: token, portal: portal, api: api);
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
