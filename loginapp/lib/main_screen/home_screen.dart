import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart'; // unused import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
// import 'package:loginapp/data/storedchapter.dart'; // unused import
import 'package:loginapp/main_screen/book_page.dart';
import 'package:loginapp/main_screen/preview_new.dart';
import 'package:loginapp/main_screen/preview_box.dart';
import 'package:loginapp/main_screen/trending_bar.dart';
import 'package:loginapp/constant.dart';
import 'package:loginapp/tool/side_bar.dart';
import 'package:loginapp/data/storedbooks.dart';
import '../data/book.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final ref = FirebaseDatabase.instance.ref('books');
  bool _isDarkTheme = false;
  List<Book> trendingMonthEntries = [];
  List<Book> trendingEntries = [];
  List<Book> entries = [];
  List<Book> saveEntries = [];
  void toggleDarkTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
      appBarBG = _isDarkTheme
          ? const Color.fromARGB(255, 0, 0, 0)
          : const Color.fromARGB(255, 0, 255, 132);
      buttonBG = _isDarkTheme
          ? const Color.fromARGB(255, 80, 80, 80)
          : const Color.fromARGB(255, 0, 120, 255);
      mainScreenBG = _isDarkTheme
          ? const Color.fromARGB(255, 70, 70, 70)
          : const Color.fromARGB(255, 255, 255, 255);
      mainScreenText = _isDarkTheme
          ? const Color.fromARGB(255, 255, 255, 255)
          : const Color.fromARGB(255, 0, 0, 0);
      mainScreenTextLight = _isDarkTheme
          ? const Color.fromARGB(255, 196, 196, 196)
          : const Color.fromARGB(255, 70, 70, 70);
      iconColor = _isDarkTheme
          ? const Color.fromARGB(255, 255, 255, 255)
          : const Color.fromARGB(255, 100, 100, 100);
      appBarBGLight = _isDarkTheme
          ? const Color.fromARGB(255, 120, 120, 120)
          : const Color.fromARGB(255, 165, 255, 212);
      shadow = _isDarkTheme
          ? const Color.fromARGB(255, 130, 130, 130)
          : const Color.fromARGB(255, 199, 199, 199);
      commentButton = _isDarkTheme ? iconColor : Colors.greenAccent;
      iconTheme = _isDarkTheme ? Icons.brightness_3 : Icons.sunny;
      iconThemeToggle =
          _isDarkTheme ? Icons.toggle_on : Icons.toggle_off_outlined;
    });
  }

  bool showSearch = false;
  bool typing = false;
  bool showTrendingBar = false;
  bool showTrendingMonth = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    getBooks().then((bookList) {
      setState(() {
        entries = bookList;
        saveEntries = bookList;
        trendingEntries = topEntries;
        trendingMonthEntries = monthEntries;
      });
    });
  }

  void refreshPage() {
    getBooks().then((bookList) {
      setState(() {
        entries = bookList;
        saveEntries = bookList;
        trendingEntries = topEntries;
        trendingMonthEntries = monthEntries;
      });
    });
  }

  void searchBook(String query) {
    setState(() {
      if (query.isEmpty) {
        entries = List.from(
            saveEntries); // Khôi phục dữ liệu ban đầu nếu người dùng không nhập gì
        return;
      }
      entries = saveEntries
          .where((book) =>
              book.title?.toLowerCase().contains(query.toLowerCase()) ?? false)
          .toList();
    });
  }

  final ScrollController _scrollController = ScrollController();
  void _scrollUp() {
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,
    );
  }

  void showNotificationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Truyện mới'),
          content: const Text('Chưa có truyện mới nào'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 69,
        backgroundColor: appBarBG,
        leading: Builder(
          builder: (context) {
            return Row(
              children: [
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: CircleAvatar(
                    /*Lấy avatar từ tài khoản google người dùng, thay một varible vào*/
                    radius: 20,
                    backgroundImage: NetworkImage(user.photoURL!),
                  ),
                ),
              ],
            );
          },
        ),
        automaticallyImplyLeading: false,
        actions: [
          //refresh
          IconButton(
            onPressed: refreshPage,
            icon: const Icon(
              Icons.refresh,
            ),
            iconSize: 40,
          ),
          // search
          IconButton(
            onPressed: () {
              setState(() {
                showSearch = !showSearch;
              });
              showSearch ? _scrollUp() : 0;
            },
            icon: const Icon(
              Icons.search,
            ),
            iconSize: 40,
          ),
          // notifications
          IconButton(
            onPressed: () {
              showNotificationDialog(context);
            },
            icon: const Icon(
              Icons.notifications,
              color: Colors.yellow,
            ),
            iconSize: 40,
          )
        ],
      ),

      drawer: SideBar(
        toggleDarkTheme,
      ),
      // Main part of Screen
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          color: mainScreenBG,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              const SizedBox(height: 20),
              // search
              Visibility(
                visible: showSearch,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.all(10),
                      child: TextFormField(
                        onChanged: searchBook,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: mainScreenText,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: appBarBG,
                          hintText: 'Nhập tên tác giả hay truyện',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: mainScreenText,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: iconColor,
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      controller: ScrollController(),
                      itemCount: entries.length.clamp(0, 5),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(10, 8, 10, 5),
                          child: ListTile(
                            leading: Image.network(
                              entries[index].cover!,
                              fit: BoxFit.fitWidth,
                              width: 40,
                              height: 150,
                            ),
                            title: Text(
                              entries[index].title!,
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookPage(
                                  cover: entries[index].cover!,
                                  title: entries[index].title!,
                                  tags: entries[index].getTags()!,
                                  author: entries[index].author!,
                                  description: entries[index].description!,
                                  chapterList: entries[index].chapterList!,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),

              // trending
              Visibility(
                visible: showTrendingBar,
                child: Column(
                  children: [
                    // the text
                    Center(
                      child: SizedBox(
                        height: 50,
                        width: 380,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(159, 125, 125, 125),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Text(
                            'Nổi bật',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: mainScreenText,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    // the list
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        itemCount: trendingEntries.length.clamp(1, 10),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => showDialog(
                              context: context,
                              builder: (context) => PreviewBox(
                                cover: trendingEntries[index].cover!,
                                title: trendingEntries[index].title!,
                                description:
                                    trendingEntries[index].description!,
                                tags: trendingEntries[index].getTags()!,
                                author: trendingEntries[index].author!,
                                chapterList:
                                    trendingEntries[index].chapterList!,
                              ),
                            ),
                            child: TrendingBar(
                              title: trendingEntries[index].title!,
                              cover: trendingEntries[index].cover!,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // trending month
              Visibility(
                visible: showTrendingMonth,
                child: Column(
                  children: [
                    // the text
                    Center(
                      child: SizedBox(
                        height: 50,
                        width: 380,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(159, 125, 125, 125),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Text(
                            'Top tháng',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: mainScreenText,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    // the list
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        //top 10 tháng
                        itemCount: trendingMonthEntries.length.clamp(0, 10),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => showDialog(
                              context: context,
                              builder: (context) => PreviewBox(
                                cover: trendingMonthEntries[index].cover!,
                                description:
                                    trendingMonthEntries[index].description!,
                                tags: trendingMonthEntries[index].getTags()!,
                                title: trendingMonthEntries[index].title!,
                                author: trendingMonthEntries[index].author!,
                                chapterList:
                                    trendingMonthEntries[index].chapterList!,
                              ),
                            ),
                            child: TrendingBar(
                              cover: trendingMonthEntries[index].cover!,
                              title: trendingMonthEntries[index].title!,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // new chapters
              Column(
                children: [
                  SizedBox(
                    height: 80,
                    child: Center(
                      child: SizedBox(
                        height: 50,
                        width: 380,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(159, 125, 125, 125),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Text(
                            'Chương mới nhất',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: mainScreenText,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // list of new chapters
                  ListView.builder(
                    physics: const ScrollPhysics(),
                    itemCount: entries.length,
                    // padding: const EdgeInsets.all(20),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => showDialog(
                          context: context,
                          builder: (context) => PreviewBox(
                            title: entries[index].title!,
                            tags: entries[index].getTags()!,
                            description: entries[index].description!,
                            cover: entries[index].cover!,
                            author: entries[index].author!,
                            chapterList: entries[index].chapterList!,
                          ),
                        ),
                        child: PreviewNew(
                          title: entries[index].title!,
                          cover: entries[index].cover!,
                          newestChapter: entries[index].chapterList!.last,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: appBarBG,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showTrendingBar = !showTrendingBar;
                  showSearch = false;
                  showTrendingMonth = false;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(buttonBG),
                overlayColor: MaterialStateProperty.resolveWith(
                    (states) => buttonBGLight),
              ),
              child: Row(
                children: const [
                  Icon(
                    FontAwesomeIcons.fire,
                    color: Colors.deepOrange,
                  ),
                  SizedBox(width: 5),
                  Text('Nổi bật'),
                ],
              ),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showTrendingMonth = !showTrendingMonth;
                  showSearch = false;
                  showTrendingBar = false;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(buttonBG),
                overlayColor: MaterialStateProperty.resolveWith(
                    (states) => buttonBGLight),
              ),
              child: Row(
                children: const [
                  Icon(
                    FontAwesomeIcons.trophy,
                    color: Colors.yellow,
                  ),
                  SizedBox(width: 10),
                  Text('Top tháng'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
