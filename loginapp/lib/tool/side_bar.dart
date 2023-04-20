import 'package:loginapp/homepage.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/constant.dart';
import 'package:loginapp/tool/add_book.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              // account header
              UserAccountsDrawerHeader(
                accountName: Text(
                  'Account Name',
                  style: TextStyle(
                    color: mainScreenText,
                    fontSize: 25,
                  ),
                ),
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                currentAccountPicture: const CircleAvatar(
                  radius: 10,
                  //backgroundImage: NetworkImage()
                ),
                accountEmail: Text(
                  'example@example.com',
                  style: TextStyle(
                    color: mainScreenText,
                  ),
                ),
                decoration: BoxDecoration(color: appBarBG),
                /*Lấy data từ google hay gì đó*/
              ),
              // account
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
              // saved books
              ListTile(
                leading: Icon(
                  Icons.library_books,
                  size: 50,
                  color: iconColor,
                ),
                title: Text(
                  'Tủ sách',
                  style: TextStyle(
                    fontSize: 20,
                    color: mainScreenText,
                  ),
                ),
                onTap: () {},
              ),
              // Add book (admin)
              ListTile(
                leading: Icon(
                  Icons.verified_user,
                  size: 50,
                  color: iconColor,
                ),
                title: Text(
                  'Quản trị',
                  style: TextStyle(
                    fontSize: 20,
                    color: mainScreenText,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddBook(),
                    ),
                  );
                },
              ),
              // Dark mode
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
              // Report error
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
