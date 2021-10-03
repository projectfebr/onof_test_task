import 'package:flutter/material.dart';
import 'package:onof_test_task/ui/widgets/documents_list/documents_list_model.dart';
import 'package:onof_test_task/ui/widgets/drawer_widget/drawer_widget.dart';
import 'package:onof_test_task/ui/widgets/documents_list/documents_list_widget.dart';
import 'package:onof_test_task/ui/widgets/main_screen/main_screen_model.dart';
import 'package:provider/provider.dart';

class MainScreenWidget extends StatelessWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _TitleWidget(),
      ),
      drawer: const DrawerWidget(),
      body: const _BodyWidget(),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedTab =
        context.select<MainScreenModel, Section>((model) => model.selectedTab);
    switch (selectedTab) {
      case Section.myDocuments:
        return const Text('My Documents');
      case Section.commonDocuments:
        return const Text('Common Documents');
    }
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedTab =
        context.select<MainScreenModel, Section>((model) => model.selectedTab);
    final documentsListModel = DocumentsListModel(selectedTab);
    return ChangeNotifierProvider<DocumentsListModel>.value(
      value: documentsListModel,
      child: const DocumentsListWidget(),
    );
  }
}
