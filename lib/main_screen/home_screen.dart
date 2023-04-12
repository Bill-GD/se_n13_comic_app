
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:read_app/main_screen/danh_sach.dart';
import 'package:read_app/main_screen/preview.dart';
import 'package:read_app/main_screen/trending.dart';
import 'package:read_app/preview_trending.dart';

import 'package:read_app/tool/thanh_ben.dart';
class HomeScreen extends StatefulWidget{


  @override
  HomeScreenState createState() => HomeScreenState();
}
class HomeScreenState extends State<HomeScreen>{
  final book_title =[//Tiêu đề tạm thời. Thêm dữ liệu từ data base

  'Tôi là mèo nên tôi sẽ kêu meomeo',
  'Tôi là chó nên tôi sẽ kêu gâu gâu',
  'Tôi là lợn nên tôi sẽ kêu ụt ịt',
  'Smooth Words',
  'I honestly find her about as intimidating as a basket of kittens.',
  'I honestly find her about as intimidating as a basket of kittens.',
];
final tag =[//Tag tạm thời. Lấy dữ liệu về
  'Học đường, Lãng mạn, Shounen, Drama',
  'Học đường, Lãng mạn, Shounen, Drama',
  'Học đường, Lãng mạn, Shounen, Drama',
  'Học đường, Lãng mạn, Shounen, Drama',
  'Học đường, Lãng mạn, Shounen, Drama',
  'Học đường, Lãng mạn, Shounen, Drama'
];
final gioi_thieu=[//Giới thiệu/tóm tắt tạm thời. Lấy dữ liệu về
'Đây là giới thiệu tác phẩm',
'Đây là giới thiệu tác phẩm',
'Đây là giới thiệu tác phẩm',
'Đây là giới thiệu tác phẩm',
'Đây là giới thiệu tác phẩm',
'Đây là giới thiệu tác phẩm',
];
final anhbia=[//Ảnh bìa tạm thời. Lấy link ảnh vào đây, tạm thời để ảnh có sẵn
  'Asset/cato.png',
  'Asset/noimage.jpg',
  'Asset/noimage.jpg',
  'Asset/noimage.jpg',
  'Asset/noimage.jpg',
  'Asset/noimage.jpg',
];
 final trending_title =[ //tiêu đề sách trending
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
final trending_image =[ //ảnh sách trending
 'Asset/bunny-rabbit.jpg',
  'Asset/noimage.jpg',
  'Asset/noimage.jpg',
  'Asset/noimage.jpg',
  'Asset/noimage.jpg',
  'Asset/noimage.jpg',
 'Asset/noimage.jpg',
  'Asset/noimage.jpg',
  'Asset/noimage.jpg',
  'Asset/noimage.jpg',
 ];
final trending_des=[//Giới thiệu/tóm tắt tạm thời sách trending. Lấy dữ liệu về
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
final trending_tag=[//tag của sách trending
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
  Widget build(BuildContext context){
    return Scaffold(             
      appBar: AppBar(        
        toolbarHeight: 69,
        backgroundColor: Color.fromARGB(255, 0, 255, 132),
        leading: 
        Builder(builder: (context){
          return GestureDetector(
      onTap: () => Scaffold.of(context).openDrawer(),
      child: const CircleAvatar(    /*Lấy avatar từ tài khoản google người dùng, thay một varible vào*/    
        radius: 10, 
       backgroundImage: NetworkImage(''),
     
         ),
         );
        }),
            automaticallyImplyLeading: false,    
            actions: [
             IconButton(onPressed: (() {}/*MỞ thanh tìm kiếm*/), icon: Icon(Icons.search), iconSize: 40), 
             IconButton(onPressed: (() {}/*MỞ thanh thông báo*/), icon: Icon(Icons.notifications, color: Colors.amber), iconSize: 40,)              
            ],           
         ),      
         drawer: thanhben(),

/*  Trung tâm màn hình  */

         body: 
         ListView(
          children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.center,  
              children: [TextButton.icon(
    label: Text('Nổi bật'),
    icon: Icon(FontAwesomeIcons.fire, color: Color.fromARGB(255, 147, 51, 44)),
    style: TextButton.styleFrom(side: BorderSide(width: 1.0)),
    onPressed: () {

      /*  Nổi bật  */
    }
  ),
 TextButton.icon(
    label: Text('Top tháng'),
    icon: Icon(FontAwesomeIcons.trophy, color: Colors.yellow),
    style: TextButton.styleFrom(side: BorderSide(width: 1.0),
  ),
    onPressed: () {

      /*  Top tháng */
    }
  ),
  TextButton.icon(
    label: Text('Mới'),
    icon: Icon(FontAwesomeIcons.exclamation, color: Color.fromARGB(255, 255, 0, 0)),    
    style: TextButton.styleFrom(side: BorderSide(width: 1.0),
  ),
    onPressed: () {

      /*  Mới */
    }
  )
 ]
),
//thanh nổi bật

    Container(
  height: 200,
  child:
   ListView.builder(//top 10 nổi bật
    itemCount: 10,
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) { 
      return GestureDetector(
onLongPress: () =>
showDialog(context: context, builder:(context) => 
preview_trending(trending_image_pr: trending_image[index], 
trending_title_pr: trending_title[index], 
trending_des_pr: trending_des[index],
trending_tag_pr: trending_tag[index])
),
child: trending_bar(bookChild_trending_title:trending_title[index], 
         bookChild_trending_image: trending_image[index])
  
    );
  
  }
  )
  ),
  
  

// dòng chữ Chương mới nhất

Center(
  child: Container(
    child: Text('Chương mới nhất', textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
    decoration: BoxDecoration(color: Color.fromARGB(159, 179, 179, 179),
    borderRadius: BorderRadius.all(Radius.circular(10))
    ),
  )
  ),

//danh sách truyện
  
  GridView.builder(
  physics: ScrollPhysics(),
  itemCount: book_title.length,
  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 200,
    crossAxisSpacing: 20,
    mainAxisSpacing: 20,

  ),
  padding: const EdgeInsets.all(8),
  shrinkWrap: true,
  itemBuilder: (context, index) {
  return GestureDetector(
  onLongPress: () => showDialog(context: context, builder:(context) => 
  preview(
  bookChild: book_title[index], 
  bookChild2: tag[index],
  bookChild3: gioi_thieu[index],
  bookChild_Image: anhbia[index],)
  ),
  child:danh_sach(bookChild: book_title[index], bookChild_Image: anhbia[index],)//danh sách
  );//danh sách
})
],
),
);
          
    
      
    
  }
}