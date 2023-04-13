import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/main_screen/list.dart';
import 'package:loginapp/main_screen/preview.dart';
import 'package:loginapp/main_screen/trending.dart';
import 'package:loginapp/previewTrending.dart';

import 'package:loginapp/tool/side_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final bookTitle = [
    //Tiêu đề tạm thời. Thêm dữ liệu từ data base

    'Tôi là mèo nên tôi sẽ kêu meomeo',
    'Tôi là chó nên tôi sẽ kêu gâu gâu',
    'Tôi là lợn nên tôi sẽ kêu ụt ịt',
    'Smooth Words',
    'I honestly find her about as intimidating as a basket of kittens.',
    'I honestly find her about as intimidating as a basket of kittens.',
  ];
  final tag = [
    //Tag tạm thời. Lấy dữ liệu về
    'Học đường, Lãng mạn, Shounen, Drama',
    'Học đường, Lãng mạn, Shounen, Drama',
    'Học đường, Lãng mạn, Shounen, Drama',
    'Học đường, Lãng mạn, Shounen, Drama',
    'Học đường, Lãng mạn, Shounen, Drama',
    'Học đường, Lãng mạn, Shounen, Drama'
  ];
  final summary = [
    //Giới thiệu/tóm tắt tạm thời. Lấy dữ liệu về
    'Đây là giới thiệu tác phẩm',
    'Đây là giới thiệu tác phẩm',
    'Đây là giới thiệu tác phẩm',
    'Đây là giới thiệu tác phẩm',
    'Đây là giới thiệu tác phẩm',
    'Đây là giới thiệu tác phẩm',
  ];
  final image = [
    //Ảnh bìa tạm thời. Lấy link ảnh vào đây, tạm thời để ảnh có sẵn
    'assets/cato.png',
    'assets/noimage.jpg',
    'assets/noimage.jpg',
    'assets/noimage.jpg',
    'assets/noimage.jpg',
    'assets/noimage.jpg',
  ];
  final trendingTitle = [
    //tiêu đề sách trending
    'Nhập tên 1 vào đây',
    'Nhập tên 2 vào đây',
    'Nhập tên 3 vào đây',
    'Nhập tên 4 vào đây',
    'Nhập tên 5 vào đây',
    'Nhập tên 6 vào đây',
    'Nhập tên 7 vào đây',
    'Nhập tên 8 vào đây',
    'Nhập tên 9 vào đây',
    'Nhập tên 10 vào đây',
  ];
  final trendingImage = [
    //ảnh sách trending
    'assets/bunny-rabbit.jpg',
    'assets/noimage.jpg',
    'assets/noimage.jpg',
    'assets/noimage.jpg',
    'assets/noimage.jpg',
    'assets/noimage.jpg',
    'assets/noimage.jpg',
    'assets/noimage.jpg',
    'assets/noimage.jpg',
    'assets/noimage.jpg',
  ];
  final trendingDesc = [
    //Giới thiệu/tóm tắt tạm thời sách trending. Lấy dữ liệu về
    'Đây là tác phẩm về gì đó',
    'Đây là tác phẩm về gì đó',
    'Đây là tác phẩm về gì đó',
    'Đây là tác phẩm về gì đó',
    'Đây là tác phẩm về gì đó',
    'Đây là tác phẩm về gì đó',
    'Đây là tác phẩm về gì đó',
    'Đây là tác phẩm về gì đó',
    'Đây là tác phẩm về gì đó',
    'Đây là tác phẩm về gì đó',
  ];
  final trendingTag = [
    //tag của sách trending
    'Học đường, Lãng mạn, Shounen, Drama',
    'Học đường, Lãng mạn, Shounen, Drama',
    'Học đường, Lãng mạn, Shounen, Drama',
    'Học đường, Lãng mạn, Shounen, Drama',
    'Học đường, Lãng mạn, Shounen, Drama',
    'Học đường, Lãng mạn, Shounen, Drama',
    'Học đường, Lãng mạn, Shounen, Drama',
    'Học đường, Lãng mạn, Shounen, Drama',
    'Học đường, Lãng mạn, Shounen, Drama',
    'Học đường, Lãng mạn, Shounen, Drama',
    'Học đường, Lãng mạn, Shounen, Drama',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 69,
        backgroundColor: const Color.fromARGB(255, 0, 255, 132),
        leading: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: const CircleAvatar(
                /*Lấy avatar từ tài khoản google người dùng, thay một varible vào*/
                radius: 10,
                backgroundImage: NetworkImage(''),
              ),
            );
          },
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {} /*MỞ thanh tìm kiếm*/,
            icon: const Icon(Icons.search),
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
      drawer: SideBar(),

/*  Trung tâm màn hình  */

      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                label: const Text('Nổi bật'),
                icon: const Icon(FontAwesomeIcons.fire, color: Color.fromARGB(255, 147, 51, 44)),
                style: TextButton.styleFrom(side: const BorderSide(width: 1.0)),
                onPressed: () {
                  /*  Nổi bật  */
                },
              ),
              TextButton.icon(
                label: const Text('Top tháng'),
                icon: const Icon(FontAwesomeIcons.trophy, color: Colors.yellow),
                style: TextButton.styleFrom(
                  side: const BorderSide(width: 1.0),
                ),
                onPressed: () {
                  /*  Top tháng */
                },
              ),
              TextButton.icon(
                label: const Text('Mới'),
                icon:
                    const Icon(FontAwesomeIcons.exclamation, color: Color.fromARGB(255, 255, 0, 0)),
                style: TextButton.styleFrom(
                  side: const BorderSide(width: 1.0),
                ),
                onPressed: () {
                  /*  Mới */
                },
              ),
            ],
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
                  onLongPress: () => showDialog(
                    context: context,
                    builder: (context) => PreviewTrending(
                        trendingImagePreview: trendingImage[index],
                        trendingTitlePreview: trendingTitle[index],
                        trendingDescPreview: trendingDesc[index],
                        trendingTagPreview: trendingTag[index]),
                  ),
                  child: TrendingBar(
                    bookChildTrendingTitle: trendingTitle[index],
                    bookChildTrendingImage: trendingImage[index],
                  ),
                );
              },
            ),
          ),

// dòng chữ Chương mới nhất

          Center(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(159, 179, 179, 179),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: const Text(
                'Chương mới nhất',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

//danh sách truyện

          GridView.builder(
            physics: const ScrollPhysics(),
            itemCount: bookTitle.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            padding: const EdgeInsets.all(8),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onLongPress: () => showDialog(
                  context: context,
                  builder: (context) => Preview(
                    bookChild: bookTitle[index],
                    bookChild2: tag[index],
                    bookChild3: summary[index],
                    bookChildImage: image[index],
                  ),
                ),
                child: List(
                  bookChild: bookTitle[index],
                  bookChildImage: image[index],
                ), //danh sách
              ); //danh sách
            },
          )
        ],
      ),
    );
  }
}
