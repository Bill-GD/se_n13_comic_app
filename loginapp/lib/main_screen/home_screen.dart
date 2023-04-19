import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/main_screen/book_page.dart';
import 'package:loginapp/main_screen/previewlist.dart';
import 'package:loginapp/main_screen/preview.dart';
import 'package:loginapp/main_screen/trending.dart';
import 'package:loginapp/preview_trending.dart';
import 'package:loginapp/constant.dart';
import 'package:loginapp/tool/side_bar.dart';
import 'package:loginapp/data/storedbooks.dart';
import 'package:loginapp/main_screen/preview_month.dart';
import 'package:loginapp/main_screen/trending_month.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool _isDarkTheme = false;
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
      iconColor = _isDarkTheme
          ? const Color.fromARGB(255, 255, 255, 255)
          : const Color.fromARGB(255, 100, 100, 100);
      iconTheme = _isDarkTheme ? Icons.brightness_3 : Icons.sunny;
      iconThemeToggle = _isDarkTheme ? Icons.toggle_on : Icons.toggle_off_outlined;
    });
  }

  bool searchShow = false;
  bool typing = false;
  bool trendingBarShow = false;
  bool trendingMonthShow = false;

  void searchBook(String query) {
    final hint = entries.where((book) {
      final title = book.title!;
      final input = query.toLowerCase();
      return title.contains(input);
    }).toList();
    setState(() {
      entries = hint;
    });
  }

  List newChapters = [
    //chương mới nhất
    'Chương 6 Tập 69',
    'Chương 6 Tập 69',
    'Chương 6 Tập 69',
    'Chương 6 Tập 69',
    'Chương 6 Tập 69',
    'Chương 6 Tập 69',
  ];

  @override
  Widget build(BuildContext context) {
    // MaterialStateProperty<Color> GetoverlayColor(Color color, Color colorPressed) {
    //   final GetoverlayColor = (Set<MaterialState> states) {
    //     if (states.contains(MaterialState.pressed)) {
    //       return colorPressed;
    //     } else {
    //       return color;
    //     }
    //     ;
    //   };
    //   return MaterialStateProperty.resolveWith(GetoverlayColor);
    // }
    // i don't know wtf is this code
    // do something about this

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
                  child: const CircleAvatar(
                    /*Lấy avatar từ tài khoản google người dùng, thay một varible vào*/
                    radius: 20,
                    backgroundImage: NetworkImage(''),
                  ),
                ),
              ],
            );
          },
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                searchShow = !searchShow;
              });
            },
            icon: const Icon(
              Icons.search,
            ),
            iconSize: 40,
          ),
          IconButton(
            onPressed: () {} /*MỞ thanh thông báo*/,
            icon: const Icon(
              Icons.notifications,
              color: Colors.amber,
            ),
            iconSize: 40,
          )
        ],
      ),

      // pass toggleDarkTheme as the Function argument to SideBar()
      drawer: SideBar(
        toggleDarkTheme,
      ),

      // Main part of Screen
      body: Container(
        color: mainScreenBG,
        child: ListView(
          children: [
            //tìm kiếm
            Visibility(
              visible: searchShow,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.all(10),
                    child: TextField(
                      onChanged: searchBook,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 0, 255, 132),
                        hintText: 'Nhập tên tác giả hay truyện',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: entries.length,
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
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
              child: Center(
                child: SizedBox(
                  height: 50,
                  width: 400,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(159, 179, 179, 179),
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
            ),
            //thanh nổi bật
            SizedBox(
              height: 200,
              child: ListView.builder(
                //top 10 nổi bật
                itemCount: 10,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => PreviewTrending(
                        trendingImagePreview: trendingEntries[index].cover!,
                        trendingTitlePreview: trendingEntries[index].title!,
                        trendingDescPreview: trendingEntries[index].description!,
                        trendingTagPreview: trendingEntries[index].getTags()!,
                        trendingAuthor: trendingEntries[index].author!,
                      ),
                    ),
                    child: TrendingBar(
                      bookChildTrendingTitle: trendingEntries[index].title!,
                      bookChildTrendingImage: trendingEntries[index].cover!,
                    ),
                  );
                },
              ),
            ),

            //thanh top tháng
            Visibility(
              visible: trendingMonthShow,
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  //top 10 tháng
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onLongPress: () => showDialog(
                          context: context,
                          builder: (context) => PreviewMonth(
                                trendingMonthCover: trendingMonthEntries[index].cover!,
                                trendingMonthDescription: trendingMonthEntries[index].description!,
                                trendingMonthTags: trendingMonthEntries[index].getTags()!,
                                trendingMonthTitle: trendingMonthEntries[index].title!,
                                trendingMonthAuthor: trendingMonthEntries[index].author!,
                              )),
                      child: TrendingMonth(
                        trendingMonthCoverPreview: trendingMonthEntries[index].cover!,
                        trendingMonthTitlePreview: trendingMonthEntries[index].title!,
                      ),
                    );
                  },
                ),
              ),
            ),
            // dòng chữ Chương mới nhất
            SizedBox(
              height: 80,
              child: Center(
                child: SizedBox(
                  height: 50,
                  width: 400,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(159, 179, 179, 179),
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

            //danh sách truyện
            GridView.builder(
              physics: const ScrollPhysics(),
              itemCount: entries.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => Preview(
                      bookChildTitle: entries[index].title!,
                      bookChildTags: entries[index].getTags()!,
                      bookChildDesc: entries[index].description!,
                      bookChildImage: entries[index].cover!,
                      bookChildAuthor: entries[index].author!,
                    ),
                  ),
                  child: PreviewList(
                    bookChild: entries[index].title!,
                    bookChildImage: entries[index].cover!,
                    bookChildNewest: newChapters[index],
                  ), //danh sách
                ); //danh sách
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: appBarBG,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  trendingBarShow = !trendingBarShow;
                  trendingMonthShow = false;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(buttonBG),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                ),
                // overlayColor: GetoverlayColor(
                //   Colors.white,
                //   Color.fromARGB(217, 181, 212, 163),
                // ),
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
                  trendingMonthShow = !trendingMonthShow;
                  trendingBarShow = false;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(buttonBG),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: const BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                ),
                // overlayColor: GetoverlayColor(
                //   Colors.white,
                //   Color.fromARGB(217, 181, 212, 163),
                // ),
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
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(buttonBG),
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.error,
                    color: Color(0xFFFF0000),
                  ),
                  SizedBox(width: 5),
                  Text('Mới'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
