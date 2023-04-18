import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:read_app/tool/Nhap_sach.dart';
class thanhben extends StatefulWidget {
  @override
  thanhben_state createState() => thanhben_state();

}
class thanhben_state extends State<thanhben>{
  @override
  Widget build(BuildContext context){
    return Container(
      child: Drawer(
        
        child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: null, 
        currentAccountPicture: CircleAvatar(/*backgroundImage: NetworkImage()*/),
        
        accountEmail: null,
        decoration: BoxDecoration(color: Color.fromARGB(255, 0, 255, 132)),
        /*Lấy data từ google hay gì đó*/
        ),
ListTile(
  leading: Icon(Icons.library_books, size: 50,),
  title: Text('Tủ sách'),
  onTap: () {},
),
ListTile(
  leading: Icon(Icons.person, size: 50,),
  title: Text('Tài khoản'),
  onTap: () {},
),
ListTile(
  leading: Icon(Icons.wallet, size: 50,),
  title: Text('Thanh toán'),
    onTap: () {},
),
ListTile(
  leading: Icon(Icons.report, size: 50,),
  title: Text('Báo lỗi'),
  onTap: () {},
),
ListTile(
  leading: Icon(Icons.verified_user, size: 50,),
  title: Text('Quản trị/Đối tác'),
  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)
  =>nhap_info()
  )
  );
           },//Thêm truyện thông tin vào 
),
 ListTile(//chăm sóc khách hàng
  leading: Icon(FontAwesomeIcons.headset, size: 50,),
  title: Text('Chăm sóc khách hàng'),
  onTap: () {},
),
      ],
      )),
    );
  }
}