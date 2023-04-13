import 'package:loginapp/homepage.dart';
import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  SideBarState createState() => SideBarState();
}

class SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: null,
            currentAccountPicture: CircleAvatar(/*backgroundImage: NetworkImage()*/),
            accountEmail: null,
            decoration: BoxDecoration(color: Color.fromARGB(255, 0, 255, 132)),
            /*Lấy data từ google hay gì đó*/
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              size: 50,
            ),
            title: const Text('Tài khoản'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.report,
              size: 50,
            ),
            title: const Text('Báo lỗi'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
