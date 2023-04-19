import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookPage extends StatelessWidget {
  final String cover;
  final String title;
  final String description;
  final String tags;
  final String author;
  BookPage({
    super.key,
    required this.cover,
    required this.title,
    required this.description,
    required this.tags,
    required this.author,
  });
  List chapterList = [
    //giúp tôi tạo mỗi một bộ truyện đều có một list danh sách này với, có thể tách riêng từng tập ra
    'Chương 1 Tập 1',
    'Chương 2 Tập 1',
    'Chương 3 Tập 1',
    'Chương 4 Tập 1',
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 0, 255, 132),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: Image.network(
                      cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ), //Lấy tên tác phẩm
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 195, 0),
                    child: Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            const WidgetSpan(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.0),
                                child: Icon(
                                  FontAwesomeIcons.userPen,
                                  color: Color.fromARGB(255, 211, 104, 58),
                                ),
                              ),
                            ),
                            TextSpan(text: 'Tác giả: $author'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          children: [
                            const WidgetSpan(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.0),
                                child: Icon(
                                  FontAwesomeIcons.tag,
                                  color: Color.fromARGB(255, 211, 104, 58),
                                ),
                              ),
                            ),
                            TextSpan(text: ' Thể loại: $tags'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 50, 0),
                    child: Expanded(
                      child: Text(
                        'Giới thiệu: $description',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 196,
                      height: 80,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ElevatedButton.icon(
                          onPressed: () {}, // follow function
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 0, 255, 132),
                          ),
                          icon: const Icon(
                            FontAwesomeIcons.solidHeart,
                            color: Colors.pink,
                          ),
                          label: const Text(
                            'Theo dõi',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: SizedBox(
                  width: 500,
                  height: 80,
                  child: Container(
                    height: 100,
                    color: const Color.fromARGB(255, 0, 255, 132),
                    child: Center(
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.0),
                                child: Icon(
                                  FontAwesomeIcons.list,
                                  color: Color.fromARGB(255, 211, 104, 58),
                                  size: 35,
                                ),
                              ),
                            ),
                            TextSpan(
                              text: ' Danh sách chương',
                            ),
                          ],
                        ),
                      ),
                    ),
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
      );
}
