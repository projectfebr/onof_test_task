import 'package:flutter/material.dart';
import 'package:onof_test_task/domain/data_providers/session_data_provider.dart';
import 'package:onof_test_task/ui/navigation/main_navigation.dart';
import 'package:onof_test_task/ui/widgets/main_screen/main_screen_model.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenModel>();
    model.setUserData();
    return Drawer(
      child: Column(
        children: [
          const _HeaderWidget(),
          ListTile(
            leading: const Icon(Icons.folder),
            title: const Text('My Documents'),
            onTap: () {
              model.setTab(Section.myDocuments);
              Navigator.pop(context);
            },
            selected: model.selectedTab == Section.myDocuments,
          ),
          ListTile(
            leading: const Icon(Icons.folder),
            title: const Text('Common Documents'),
            onTap: () {
              model.setTab(Section.commonDocuments);
              Navigator.pop(context);
            },
            selected: model.selectedTab == Section.commonDocuments,
          ),
          const Expanded(child: SizedBox()),
          SafeArea(
            child: TextButton(
              onPressed: () {
                SessionDataProvider().setToken(null);
                Navigator.pushReplacementNamed(
                    context, MainNavigationRouteNames.auth);
              },
              child: const Text('Logout'),
            ),
          )
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainScreenModel>();
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 2.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: SafeArea(
        maintainBottomViewPadding: false,
        bottom: false,
        child: Center(
          child: Row(
            children: [
              if (model.avatarPath != null)
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(
                    model.avatarPath!,
                    headers: {'Authorization': model.token ?? ''},
                  ),
                ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.userName ?? 'loading...',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    model.userEmail ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
