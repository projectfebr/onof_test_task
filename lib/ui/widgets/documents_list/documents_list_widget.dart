import 'package:flutter/material.dart';
import 'package:onof_test_task/ui/widgets/documents_list/documents_list_model.dart';
import 'package:provider/provider.dart';

class DocumentsListWidget extends StatelessWidget {
  const DocumentsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<DocumentsListModel>();

    return ListView.builder(
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
            onTap: () {},
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
