import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loginapp/constant.dart';

class BookPage extends StatelessWidget {
  final String cover;
  final String title;
  final String description;
  final String tags;
  final String author;
  final List<String> chapterList;
  BookPage({
    super.key,
    required this.cover,
    required this.title,
    required this.description,
    required this.tags,
    required this.author,
    required this.chapterList,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: mainScreenText,
            ),
          ),
          backgroundColor: appBarBG,
        ),
        body: Container(
          color: mainScreenBG,
          child: ListView(
            children: [
              // book information
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    // cover
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      // use network when working with database
                      child: Image.asset(
                        cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    // title
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: mainScreenText,
                        ),
                      ),
                    ),
                    // author
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 20,
                                color: mainScreenText,
                              ),
                              children: [
                                const WidgetSpan(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(2, 0, 10, 0),
                                    child: Icon(
                                      FontAwesomeIcons.userPen,
                                      color: Colors.amberAccent,
                                    ),
                                  ),
                                ),
                                TextSpan(text: 'Tác giả: $author'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // tags
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 20,
                                color: mainScreenText,
                              ),
                              children: [
                                const WidgetSpan(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Icon(
                                      FontAwesomeIcons.tag,
                                      color: Colors.amberAccent,
                                    ),
                                  ),
                                ),
                                TextSpan(text: ' Thể loại: $tags'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // description
                    Center(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 20),
                        child: Expanded(
                          child: Text(
                            description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: mainScreenText,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // follow button
              Center(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: SizedBox(
                    child: Center(
                      child: ElevatedButton.icon(
                        onPressed: () {}, // follow function
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          backgroundColor: appBarBG,
                        ),
                        icon: const Icon(
                          FontAwesomeIcons.solidHeart,
                          color: Colors.pink,
                        ),
                        label: Text(
                          'Theo dõi',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            color: mainScreenText,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // chapter list
              Center(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Container(
                    height: 80,
                    color: appBarBG,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesomeIcons.list,
                          color: Colors.amberAccent,
                          size: 35,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Danh sách chương',
                          style: TextStyle(
                            fontSize: 30,
                            color: mainScreenText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: chapterList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                    child: SizedBox(
                      height: 80,
                      child: ElevatedButton(
                        onPressed: () {
                          // read the chapter
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 225, 221, 184),
                        ),
                        child: Text(
                          chapterList[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 0, 0, 0),
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
      );
}
