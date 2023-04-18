import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class tac_pham extends StatelessWidget {
  final String anh;
  final String tieu_de;
  final String tom_tat;
  final String the_loai;
  final String tacgia_tacpham;
 tac_pham({required this.anh, required this.tieu_de, required this.tom_tat, required this.the_loai, required this.tacgia_tacpham});
List danh_sach_chuong = [//giúp tôi tạo mỗi một bộ truyện đều có một list danh sách này với, có thể tách riêng từng tập ra
  'Chương 1 Tập 1',
  'Chương 2 Tập 1',
  'Chương 3 Tập 1',
  'Chương 4 Tập 1',
];

@override
Widget build(BuildContext context)=> Scaffold(
  appBar:AppBar(title: Text(tieu_de,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),
  backgroundColor: Color.fromARGB(255, 0, 255, 132),
  ),
body: ListView(
  children:[
  Padding(padding: const EdgeInsets.all(8),
  child:  Column(children:[Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0) ,
          child: Image.network(anh, alignment: Alignment.topCenter,),),
          Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0) ,
          child: Text(tieu_de, textAlign: TextAlign.center,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)
          )),//Lấy tên tác phẩm 
          Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 195, 0) ,
          child: 
          Expanded(
          child://Tác giả
         RichText(
  text: TextSpan(
    style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
    children: [
      WidgetSpan(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: Icon(FontAwesomeIcons.userPen,color: Color.fromARGB(255, 211, 104, 58),)
        ),
      ),
      TextSpan(text: '  Tác giả: '+ tacgia_tacpham),
    ],
  ),
)
          )
          ),
          Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0) ,
          child: 
          Expanded(
          child://Thể loại hay gọi là tag
         RichText(
  text: TextSpan(
    style: TextStyle(fontSize: 20, color: Colors.black),
    children: [
      WidgetSpan(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: Icon(FontAwesomeIcons.tag,color: Color.fromARGB(255, 211, 104, 58),)
        ),
      ),
      TextSpan(text: ' Thể loại: '+ the_loai),
    ],
  ),
)
          )
          ),
          Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 50, 0) ,
          child: 
          Expanded(
          child://Giới thiệu hay tóm tắt
          Text('Giới thiệu: '+tom_tat, textAlign: TextAlign.center,style: TextStyle(fontSize: 20)
          )
          )
          )
         ])
         ),
         Center(
         child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0) ,
          child: Row(children: [
            SizedBox(
          width: 196,
          height: 80,
          child: Card(
           shape: RoundedRectangleBorder(  
            borderRadius: BorderRadius.circular(15.0),  
          ),  
            child: ElevatedButton.icon(onPressed: () {},//thêm giúp tôi chức năng theo dõi
            style: ElevatedButton.styleFrom(primary:Color.fromARGB(255, 0, 255, 132)),
           icon: Icon(FontAwesomeIcons.solidHeart, color: Colors.pink,), 
           label: Text('Theo dõi',textAlign: TextAlign.center,style: TextStyle(fontSize: 30, color: Colors.black)))
          )
          ),
          SizedBox(
          width: 196,
          height: 80,
          child: Card(
           shape: RoundedRectangleBorder(  
            borderRadius: BorderRadius.circular(15.0),  
          ),  
            child: ElevatedButton.icon(onPressed: () {},//Mua hàng, để tạm ở đây
            style: ElevatedButton.styleFrom(primary:Color.fromARGB(255, 0, 255, 132)),
           icon: Icon(FontAwesomeIcons.shopify, color: Color.fromARGB(255, 211, 104, 58),), 
           label: Text('Mua sách',textAlign: TextAlign.center,style: TextStyle(fontSize: 28, color: Colors.black)))
          )
          )
          ],)
         )
          ),
      Center(
         child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0) ,
          child: SizedBox(
          width: 500,
          height: 80,
            child: Container(height: 100,
            color: Color.fromARGB(255, 0, 255, 132),
            child: Center(child: 
            RichText(
  text: TextSpan(
    style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
    children: [
      WidgetSpan(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: Icon(FontAwesomeIcons.list,color: Color.fromARGB(255, 211, 104, 58),size: 35,)
        ),
      ),
      TextSpan(text: ' Danh sách chương'),
    ],
  ),
)
)
),
          )
          )
          ),
      
        
            Container(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: danh_sach_chuong.length,
            itemBuilder: (context, index) {
              return Padding(padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
          child: Container(
            height: 80,
            child:
             ElevatedButton(onPressed: () {   //Bấm để đọc chap nào đó
             },
            style: ElevatedButton.styleFrom(primary:Color.fromARGB(255, 225, 221, 184)),
           child: Text(danh_sach_chuong[index],textAlign: TextAlign.center,style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 0, 0, 0))))
            ,) );
            }                                          
          )
          )
           
          ]
        )
      
     );  
    
       
    
    
  



}