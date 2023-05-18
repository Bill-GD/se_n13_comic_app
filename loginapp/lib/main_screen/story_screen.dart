import 'package:flutter/material.dart';
import 'package:loginapp/data/storedchapter.dart';

import '../constant.dart';

class StoryScreen extends StatefulWidget {
  final int index;
  final List<String> imageUrls;
  final String title;
  final String chapter;
  final List<String> chapterList;

  StoryScreen(
      {required this.index,
      required this.imageUrls,
      required this.title,
      required this.chapter,
      required this.chapterList});

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  int _currentPage = 0;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

// tự động load ảnh trang tiếp theo
  void prefetchNextImage(int index) {
    if (index < widget.imageUrls.length - 1) {
      precacheImage(NetworkImage(widget.imageUrls[index + 1]), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              // hiện tiêu đề chapter
              children: [
                Text(
                  "${widget.title}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: mainScreenText,
                  ),
                ),
                Text(
                  "${widget.chapter}",
                  style: TextStyle(
                    fontSize: 15,
                    color: mainScreenText,
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: appBarBG,
      ),
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical, // cuộn dọc
        itemCount: widget.imageUrls.length,
        itemBuilder: (BuildContext context, int index) {
          prefetchNextImage(index);
          return Image.network(
            widget.imageUrls[index],
            fit: BoxFit.fitHeight,
          );
        },
        onPageChanged: (int index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white70,
        child: Container(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: _currentPage == 0
                    ? null
                    : () {
                        _pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
              ),
              Text('${_currentPage + 1}/${widget.imageUrls.length}'),
              _currentPage == widget.imageUrls.length - 1
                  ? Container(
                      height: 30,
                      width: 109,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle "Chương tiếp" button press
                          final int currentChapterIndex = widget.chapterList.indexOf(widget
                              .chapterList
                              .firstWhere((element) => element == widget.chapter));
                          if (currentChapterIndex < widget.chapterList.length - 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChapterList(
                                  index: widget.index,
                                  title: widget.title,
                                  chapter: widget.chapterList[currentChapterIndex + 1],
                                  chapterList: widget.chapterList,
                                ),
                              ),
                            );
                          } else {
                            for (int i = 0; i <= widget.index; i++) {
                              Navigator.pop(context);
                            }
                          }
                        },
                        child: Text('Chương tiếp'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                        ),
                      ),
                    )
                  : IconButton(
                      icon: Icon(Icons.arrow_forward),
                      onPressed: () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
