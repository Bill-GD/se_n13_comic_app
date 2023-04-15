import 'package:loginapp/homepage.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/constant.dart';

class SideBar extends StatefulWidget {
  final Function() toggleDarkTheme;
  const SideBar(this.toggleDarkTheme, {super.key});

  @override
  SideBarState createState() => SideBarState();
}

class SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) => Drawer(
        child: Container(
          color: mainScreenBG,
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(
                  'Account Name',
                  style: TextStyle(
                    color: mainScreenText,
                    fontSize: 25,
                  ),
                ),
                currentAccountPicture: const CircleAvatar(/*backgroundImage: NetworkImage()*/),
                accountEmail: Text(
                  'example@example.com',
                  style: TextStyle(
                    color: mainScreenText,
                  ),
                ),
                decoration: BoxDecoration(color: appBarBG),
                /*Lấy data từ google hay gì đó*/
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  size: 50,
                  color: iconColor,
                ),
                title: Text(
                  'Tài khoản',
                  style: TextStyle(
                    fontSize: 20,
                    color: mainScreenText,
                  ),
                ),
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
                leading: Icon(
                  iconTheme,
                  size: 50,
                  color: iconColor,
                ),
                title: Text(
                  'Dark Mode',
                  style: TextStyle(
                    fontSize: 20,
                    color: mainScreenText,
                  ),
                ),
                trailing: Icon(
                  iconThemeToggle,
                  size: 50,
                  color: iconColor,
                ),
                onTap: widget.toggleDarkTheme,
              ),
              ListTile(
                leading: Icon(
                  Icons.report,
                  size: 50,
                  color: iconColor,
                ),
                title: Text(
                  'Báo lỗi',
                  style: TextStyle(
                    fontSize: 20,
                    color: mainScreenText,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      );
}
