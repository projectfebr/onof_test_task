import 'package:flutter/material.dart';
import 'package:onof_test_task/domain/api_client/api_addresses.dart';
import 'package:onof_test_task/ui/widgets/documents_list/documents_list_model.dart';
import 'package:provider/provider.dart';

class DocumentsListWidget extends StatelessWidget {
  const DocumentsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<DocumentsListModel>();

    return RefreshIndicator(
      onRefresh: () async {
        await model.updateList();
      },
      child: Column(
        children: [
          if (model.parentId != null && model.parentId != 0)
            ListTile(
              title: const Text('..'),
              leading: const Icon(
                Icons.arrow_back,
                size: 34,
              ),
              onTap: () {
                model.getList(
                    '${ApiEndpoint.filesByFolderId}/${model.parentId}');
              },
            ),
          Expanded(
            child: ListView.builder(
              itemCount: model.folders.length + model.files.length,
              itemBuilder: (context, index) {
                if (index < model.folders.length) {
                  final folder = model.folders[index];
                  return ListTile(
                    title: Text(folder.title),
                    subtitle: Text(model.stringFromDate(folder.updated)),
                    leading: const Icon(
                      Icons.folder,
                      size: 34,
                    ),
                    onTap: () {
                      model.getList(
                          '${ApiEndpoint.filesByFolderId}/${folder.id}');
                    },
                  );
                } else {
                  final files = model.files[index - model.folders.length];
                  return ListTile(
                    title: Text(files.title),
                    subtitle: Text(model.stringFromDate(files.updated)),
                    leading: const Icon(
                      Icons.article,
                      size: 34,
                    ),
                    onTap: () {},
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
