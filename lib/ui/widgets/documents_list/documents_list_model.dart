import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onof_test_task/domain/api_client/api_client.dart';
import 'package:onof_test_task/domain/data_providers/session_data_provider.dart';
import 'package:onof_test_task/domain/entity/documents_list_response.dart';
import 'package:onof_test_task/ui/widgets/main_screen/main_screen_model.dart';

class DocumentsListModel extends ChangeNotifier {
  DocumentsListModel(Section section) {
    resetList(section);
  }

  final _apiClient = ApiClient();

  final _folders = <FolderOnlyOffice>[];
  List<FolderOnlyOffice> get folders => List.unmodifiable(_folders);

  final _files = <DocumentOnlyOffice>[];
  List<DocumentOnlyOffice> get files => List.unmodifiable(_files);

  final DateFormat _dateFormat = DateFormat.yMMMMd();

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  Future<void> loadDocuments(Section section) async {
    final token = await SessionDataProvider().getToken();
    final portal = await SessionDataProvider().getPortal();
    if (token == null || portal == null) return;
    DocumentsList documentsListResponse;
    switch (section) {
      case Section.myDocuments:
        documentsListResponse = await _apiClient.getDocumentsList(
            token: token, portal: portal, api: 'api/2.0/files/@my');
        break;
      case Section.commonDocuments:
        documentsListResponse = await _apiClient.getDocumentsList(
            token: token, portal: portal, api: 'api/2.0/files/@common');
        break;
    }
    _folders.addAll(documentsListResponse.response.folders);
    _files.addAll(documentsListResponse.response.files);
    notifyListeners();
  }

  Future<void> resetList(Section section) async {
    _folders.clear();
    _files.clear();
    await loadDocuments(section);
  }
}
