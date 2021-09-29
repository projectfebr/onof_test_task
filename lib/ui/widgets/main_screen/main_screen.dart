import 'package:flutter/material.dart';
import 'package:onof_test_task/domain/data_providers/token_data_provider.dart';
import 'package:onof_test_task/ui/navigation/main_navigation.dart';

class MainScreenWidget extends StatelessWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Documents'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
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
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Имя Фамилия',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'емейл@адрес.ру',
                            style: TextStyle(
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
            ),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text('My Documents'),
              onTap: () {},
              selected: true,
            ),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text('Common Documents'),
              onTap: () {},
            ),
            const Expanded(child: SizedBox()),
            SafeArea(
              child: TextButton(
                onPressed: () {
                  TokenDataProvider().setToken(null);
                  Navigator.pushReplacementNamed(
                      context, MainNavigationRouteNames.auth);
                },
                child: const Text('Logout'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
