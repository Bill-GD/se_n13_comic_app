import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/constant.dart';
import 'package:loginapp/main_screen/book_case.dart';
import 'package:loginapp/screens/logged_in_widget.dart';
import 'package:loginapp/tool/add_book.dart';
import 'package:url_launcher/url_launcher.dart';



class SideBar extends StatefulWidget {
  final Function() toggleDarkTheme;
  const SideBar(this.toggleDarkTheme, {super.key});
  @override
  SideBarState createState() => SideBarState();
}

class SideBarState extends State<SideBar> {
  @override
 Uri _url = Uri.parse('https://flutter.dev');
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Drawer(
        child: Container(
          color: mainScreenBG,
          child: ListView(
            children: <Widget>[
              // account header
              UserAccountsDrawerHeader(
                accountName: Text(
                  '${user.displayName}',
                  style: TextStyle(
                    color: mainScreenText,
                    fontSize: 25,
                  ),
                ),
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                currentAccountPicture: CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(user.photoURL!),
                ),
                accountEmail: Text(
                  '${user.email}',
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
                      builder: (context) => LoggedInWidget(),
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BookCaseScreen()),
                  );
                },
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
                onTap: () {
                 openBrowserURL("docs.google.com");
                }
              ),
            ],
          ),
        ),
      );
  }
  
 Future openBrowserURL(String url) async
 {
  final Uri uri = Uri(scheme: 'https',host: url);
  if (!await launchUrl(uri,
  mode: LaunchMode.inAppWebView,
  
  )){
    throw "Không thể truy cập";
  }
 }
  
  
}
