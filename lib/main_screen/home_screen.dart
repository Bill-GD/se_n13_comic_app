import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:read_app/main_screen/book/bookPage.dart';
import 'package:read_app/main_screen/danh_sach.dart';
import 'package:read_app/main_screen/preview.dart';
import 'package:read_app/main_screen/top_thang.dart';
import 'package:read_app/main_screen/top_thang_preview.dart';
import 'package:read_app/main_screen/preview_trending.dart';
import 'package:read_app/tool/thanh_ben.dart';
class HomeScreen extends StatefulWidget{
  @override
  HomeScreenState createState() => HomeScreenState();
}
 bool search_show = false;
 bool typing = false;
bool trending_bar_show = false;
bool trending_month_show= false;
class HomeScreenState extends State<HomeScreen>{
  void Searchbook(String query){
           final goi_y = book_info.where((book){
            final tieu_de_sach = book['book_title'];
            final input = query.toLowerCase();
            return tieu_de_sach.contains(input);
           }).toList(); 
           setState(() {book_info = goi_y;
             });
          }

  List<Map<String, dynamic>> book_info = [//Thông tin sách
    {"book_title": "Tôi là mèo", 
     "tag": "Học đường, Lãng mạn, Shounen, Drama", 
     "gioi_thieu": "Đây là giới thiệu tác phẩm",
     "anhbia":"https://iili.io/HvkZwFt.png",
     "tacgia":"Abcxyz"},
   {"book_title": "Tôi là chó nên tôi sẽ kêu gâu gâu", 
     "tag": "Học đường, Lãng mạn, Shounen, Drama", 
     "gioi_thieu": "Đây là giới thiệu tác phẩm",
     "anhbia":"https://iili.io/HvkZ76P.jpg",
     "tacgia":"Abcxyz"},
     {"book_title": "Tôi là lợn nên tôi sẽ kêu ụt ịt", 
     "tag": "Học đường, Lãng mạn, Shounen, Drama", 
     "gioi_thieu": "Đây là giới thiệu tác phẩm",
     "anhbia":"https://iili.io/HvkZ76P.jpg",
     "tacgia":"Abcxyz"},
     {"book_title": "I honestly find her about as intimidating as a basket of kittens", 
     "tag": "Học đường, Lãng mạn, Shounen, Drama", 
     "gioi_thieu": "Đây là giới thiệu tác phẩm",
     "anhbia":"https://iili.io/HvkZ76P.jpg",
     "tacgia":"Abcxyz"},
     {"book_title": "Tôi là mèo nên tôi sẽ kêu meomeo", 
     "tag": "Học đường, Lãng mạn, Shounen, Drama", 
     "gioi_thieu": "Đây là giới thiệu tác phẩm",
     "anhbia":"https://iili.io/HvkZ76P.jpg",
     "tacgia":"Abcxyz"},
     {"book_title": "Tôi là mèo", 
     "tag": "Học đường, Lãng mạn, Shounen, Drama", 
     "gioi_thieu": "Đây là giới thiệu tác phẩm",
     "anhbia":"https://iili.io/HvkZ76P.jpg",
     "tacgia":"Abcxyz"},
  ];
 List<Map<String, dynamic>> trending_info = [//thông tin trending
    {"trending_title": "Tôi là thỏ", 
     "trending_tag": "Học đường, Lãng mạn, Shounen, Drama", 
     "trending_des": "Đây là giới thiệu tác phẩm",
     "trending_image":"https://iili.io/HvkZyiB.jpg",
     "tacgia_tr":"Abcxyz"},
   {"trending_title": "Tôi là chó nên tôi sẽ kêu gâu gâu", 
     "trending_tag": "Học đường, Lãng mạn, Shounen, Drama", 
     "trending_des": "Đây là giới thiệu tác phẩm",
     "trending_image":"https://iili.io/HvkZ76P.jpg",
     "tacgia_tr":"Abcxyz"},
     {"trending_title": "Tôi là chó nên tôi sẽ kêu gâu gâu", 
     "trending_tag": "Học đường, Lãng mạn, Shounen, Drama", 
     "trending_des": "Đây là giới thiệu tác phẩm",
     "trending_image":"https://iili.io/HvkZ76P.jpg",
     "tacgia_tr":"Abcxyz"},
     {"trending_title": "Tôi là chó nên tôi sẽ kêu gâu gâu", 
     "trending_tag": "Học đường, Lãng mạn, Shounen, Drama", 
     "trending_des": "Đây là giới thiệu tác phẩm",
     "trending_image":"https://iili.io/HvkZ76P.jpg",
     "tacgia_tr":"Abcxyz"},
     {"trending_title": "Tôi là chó nên tôi sẽ kêu gâu gâu", 
     "trending_tag": "Học đường, Lãng mạn, Shounen, Drama", 
     "trending_des": "Đây là giới thiệu tác phẩm",
     "trending_image":"https://iili.io/HvkZ76P.jpg",
     "tacgia_tr":"Abcxyz"},
     {"trending_title": "Tôi là chó nên tôi sẽ kêu gâu gâu", 
     "trending_tag": "Học đường, Lãng mạn, Shounen, Drama", 
     "trending_des": "Đây là giới thiệu tác phẩm",
     "trending_image":"https://iili.io/HvkZ76P.jpg",
     "tacgia_tr":"Abcxyz"},
     {"trending_title": "Tôi là chó nên tôi sẽ kêu gâu gâu", 
     "trending_tag": "Học đường, Lãng mạn, Shounen, Drama", 
     "trending_des": "Đây là giới thiệu tác phẩm",
     "trending_image":"https://iili.io/HvkZ76P.jpg",
     "tacgia_tr":"Abcxyz"},
     {"trending_title": "Tôi là chó nên tôi sẽ kêu gâu gâu", 
     "trending_tag": "Học đường, Lãng mạn, Shounen, Drama", 
     "trending_des": "Đây là giới thiệu tác phẩm",
     "trending_image":"https://iili.io/HvkZ76P.jpg",
     "tacgia_tr":"Abcxyz"},
     {"trending_title": "Tôi là chó nên tôi sẽ kêu gâu gâu", 
     "trending_tag": "Học đường, Lãng mạn, Shounen, Drama", 
     "trending_des": "Đây là giới thiệu tác phẩm",
     "trending_image":"https://iili.io/HvkZ76P.jpg",
     "tacgia_tr":"Abcxyz"},
     {"trending_title": "Tôi là chó nên tôi sẽ kêu gâu gâu", 
     "trending_tag": "Học đường, Lãng mạn, Shounen, Drama", 
     "trending_des": "Đây là giới thiệu tác phẩm",
     "trending_image":"https://iili.io/HvkZ76P.jpg",
     "tacgia_tr":"Abcxyz"},
      ];
 List<Map<String, dynamic>> month_info = [//thông tin top tháng
    {"month_title": "Tôi là thỏ", 
     "month_tag": "Học đường, Lãng mạn, Shounen, Drama", 
     "month_des": "Đây là giới thiệu tác phẩm",
     "month_image":"https://iili.io/HvkZyiB.jpg",
     "month_auth":"Abcxyz"},
    {"month_title": "Tôi là tôi", 
     "month_tag": "Học đường, Lãng mạn, Shounen, Drama", 
     "month_des": "Đây là giới thiệu tác phẩm",
     "month_image":"https://iili.io/HvkZ76P.jpg",
     "month_auth":"Abcxyz"},
      {"month_title": "Tôi là tôi", 
     "month_tag": "Học đường, Lãng mạn, Shounen, Drama", 
     "month_des": "Đây là giới thiệu tác phẩm",
     "month_image":"https://iili.io/HvkZ76P.jpg",
     "month_auth":"Abcxyz"},
      {"month_title": "Tôi là tôi", 
     "month_tag": "Học đường, Lãng mạn, Shounen, Drama", 
     "month_des": "Đây là giới thiệu tác phẩm",
     "month_image":"https://iili.io/HvkZ76P.jpg",
     "month_auth":"Abcxyz"},
      {"month_title": "Tôi là tôi", 
     "month_tag": "Học đường, Lãng mạn, Shounen, Drama", 
     "month_des": "Đây là giới thiệu tác phẩm",
     "month_image":"https://iili.io/HvkZ76P.jpg",
     "month_auth":"Abcxyz"},
      {"month_title": "Tôi là tôi", 
     "month_tag": "Học đường, Lãng mạn, Shounen, Drama", 
     "month_des": "Đây là giới thiệu tác phẩm",
     "month_image":"https://iili.io/HvkZ76P.jpg",
     "month_auth":"Abcxyz"},
      {"month_title": "Tôi là tôi", 
     "month_tag": "Học đường, Lãng mạn, Shounen, Drama", 
     "month_des": "Đây là giới thiệu tác phẩm",
     "month_image":"https://iili.io/HvkZ76P.jpg",
     "month_auth":"Abcxyz"},
      {"month_title": "Tôi là tôi", 
     "month_tag": "Học đường, Lãng mạn, Shounen, Drama", 
     "month_des": "Đây là giới thiệu tác phẩm",
     "month_image":"https://iili.io/HvkZ76P.jpg",
     "month_auth":"Abcxyz"},
      {"month_title": "Tôi là tôi", 
     "month_tag": "Học đường, Lãng mạn, Shounen, Drama", 
     "month_des": "Đây là giới thiệu tác phẩm",
     "month_image":"https://iili.io/HvkZ76P.jpg",
     "month_auth":"Abcxyz"},
      {"month_title": "Tôi là tôi", 
     "month_tag": "Học đường, Lãng mạn, Shounen, Drama", 
     "month_des": "Đây là giới thiệu tác phẩm",
     "month_image":"https://iili.io/HvkZ76P.jpg",
     "month_auth":"Abcxyz"},
     ];
  List chap_moi=[//chương mới nhất
  'Chương 6 Tập 69',
  'Chương 6 Tập 69',
  'Chương 6 Tập 69',
  'Chương 6 Tập 69',
  'Chương 6 Tập 69',
  'Chương 6 Tập 69',
  ];
  
  @override
  Widget build(BuildContext context){
    MaterialStateProperty<Color> GetoverlayColor(Color color, Color colorPressed){
      final GetoverlayColor = (Set<MaterialState> states){
        if (states.contains(MaterialState.pressed)){
          return colorPressed;}
          else{return color;};
      };
      return MaterialStateProperty.resolveWith(GetoverlayColor);
    };
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
             IconButton(onPressed: (){ /*MỞ thanh tìm kiếm*/
              setState(() {
                search_show=!search_show;
              });
             }, 
             icon: Icon(Icons.search), iconSize: 40),               
             IconButton(onPressed: (() {}/*MỞ thanh thông báo*/), icon: Icon(Icons.notifications, color: Colors.amber), iconSize: 40,)              
            ],           
         ),      
         drawer: thanhben(),

/*  Trung tâm màn hình  */
         body: Center(child: 
         ListView(
          children: [
             Visibility(//tìm kiếm
          visible: search_show,
          child:Column(
            children: [Container(alignment: Alignment.centerLeft,
    margin: const EdgeInsets.all(10),
      child: TextField(
        onChanged: Searchbook,
        keyboardType: TextInputType.text,
        decoration:
            InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
            filled: true,
            fillColor: Color.fromARGB(255, 0, 255, 132),
            hintText: 'Nhập tên tác giả hay truyện', 
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            prefixIcon: Icon(Icons.search)
            )
      )
      ),
        ListView.builder(
        itemCount:book_info.length,
        shrinkWrap: true,
        itemBuilder:(context, index){         
         return Padding(padding: const EdgeInsets.fromLTRB(10, 8, 10, 5),
         child: ListTile(
          leading: Image.network(book_info[index]['anhbia'],
           fit: BoxFit.fitWidth,
           width: 40,
           height: 150),
           title: Text(book_info[index]['book_title']),
           onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) 
           => tac_pham(anh: book_info[index]['anhbia'],
            tieu_de: book_info[index]['book_title'], 
            the_loai: book_info[index]['tag'], 
            tacgia_tacpham: book_info[index]['tacgia'],
            tom_tat: book_info[index]['gioi_thieu'],
            )
            )
            )
         )
         );
        }
      ),
          ],
          )
          ),

//Nút nổi bật
            Row(
            mainAxisAlignment: MainAxisAlignment.center,  
              children: [
                TextButton.icon(
    label: Text('Nổi bật'),
    icon: Icon(FontAwesomeIcons.fire, color: Color.fromARGB(255, 147, 51, 44)),
    style: 
    ButtonStyle(
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: BorderSide(width: 1, color: Colors.black),
      ),
    ),      
    overlayColor: GetoverlayColor(Colors.white, Color.fromARGB(217, 181, 212, 163)),
    ),    
    onPressed: () {
      setState(() {
        trending_bar_show = !trending_bar_show;
        trending_month_show= false;
      });   
    }
  ),
 /*  Top tháng */
 TextButton.icon(
    label: Text('Top tháng'),
    icon: Icon(FontAwesomeIcons.trophy, color: Colors.yellow),
    style: ButtonStyle(
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: BorderSide(width: 1, color: Colors.black),
      ),
    ),      
    overlayColor: GetoverlayColor(Colors.white, Color.fromARGB(217, 181, 212, 163))
  ),
    onPressed: () {setState(() {
       trending_month_show= !trending_month_show;
       trending_bar_show =false;
    });

      
    }
  ),
 ]
),
//thanh nổi bật
Visibility(
  visible: trending_bar_show,
  child:Container(
  height: 200,
  child:
   ListView.builder(//top 10 trending
    itemCount: 10,
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) { 
      return GestureDetector(
onLongPress: () =>
showDialog(context: context, builder:(context) => 
preview_trending(
trending_image_pr:  trending_info[index]['trending_image'], 
trending_title_pr: trending_info[index]['trending_title'], 
trending_des_pr: trending_info[index]['trending_des'],
trending_tag_pr: trending_info[index]['trending_tag'],
author_tr: trending_info[index]['tacgia_tr'],
)
),
child: trending_month(trending_image_month_pr:trending_info[index]['trending_image'], 
         trending_title_month_pr: trending_info[index]['trending_title'])
  
    );
  
  }
  )
  ),
  ),
  

 //thanh top tháng 
  Visibility(
  visible: trending_month_show,
  child:Container(
  height: 200,
  child:
   ListView.builder(//top 10 tháng
    itemCount: 10,
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) { 
      return GestureDetector(
onLongPress: () =>
showDialog(context: context, builder:(context) => 
preview_month(
trending_image_month_pr: month_info[index]['month_image'], 
trending_des_month_pr: month_info[index]['month_des'],
trending_tag_month_pr: month_info[index]['month_tag'],
trending_title_month_pr: month_info[index]['month_title'],
author_month_tr:  month_info[index]['month_auth'],
)
),
child: trending_month(trending_image_month_pr: month_info[index]['month_image'], 
         trending_title_month_pr:  month_info[index]['month_title'])
  
    );
  
  }
  )
  ),
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
  itemCount: book_info.length,
  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 200,
    crossAxisSpacing: 20,
    mainAxisSpacing: 20,

  ),
  padding: const EdgeInsets.all(8),
  shrinkWrap: true,
  itemBuilder: (context, index) {
  return GestureDetector(
  onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) 
           => tac_pham(anh: book_info[index]['anhbia'],
            tieu_de: book_info[index]['book_title'], 
            the_loai: book_info[index]['tag'], 
            tacgia_tacpham: book_info[index]['tacgia'],
            tom_tat: book_info[index]['gioi_thieu'],
            )
            )
            ),
  onLongPress: () => showDialog(context: context, builder:(context) => 
  preview(
  bookChild: book_info[index]['book_title'], 
  bookChild2: book_info[index]['tag'],
  bookChild3: book_info[index]['gioi_thieu'],
  bookChild_Image: book_info[index]['anhbia'], 
  author:book_info[index]['tacgia'],)
  ),
  child:danh_sach(bookChild:book_info[index]['book_title'], bookChild_Image: book_info[index]['anhbia'],bookChild_newest: chap_moi[index],)//danh sách
  );//danh sách
})
],
),
)
);
          
    
      
    
  }
}